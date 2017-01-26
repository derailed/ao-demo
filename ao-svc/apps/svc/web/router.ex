defmodule Svc.Router do
  use Svc.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :gql do
    plug Ql.Context
  end

  scope "/" do
    pipe_through :gql

    # if Mix.env == "dev" do
      get     "/graphiql", Absinthe.Plug.GraphiQL, schema: Ql.Schema
      post    "/graphiql", Absinthe.Plug.GraphiQL, schema: Ql.Schema
    # end
    forward "/graphql" , Absinthe.Plug         , schema: Ql.Schema
  end
end
