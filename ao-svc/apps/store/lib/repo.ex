defmodule Store.Repo do
  @moduledoc false

  use Ecto.Repo, otp_app: :store

  def transaction_with_isolation(fun_or_multi, opts) do
    false = Store.Repo.in_transaction?
    level = Keyword.fetch!(opts, :level)

    transaction(fn ->
      {:ok, _} = Ecto.Adapters.SQL.query(Store.Repo,
        "SET TRANSACTION ISOLATION LEVEL #{level}", []
        )

      txn = case transaction(fun_or_multi, opts) do
        {:ok, result} -> {:ok, result}
        {:error, reason} -> Store.Repo.rollback(reason)
      end
      txn |> unwrap_transaction_result
    end, opts)
  end

  defp unwrap_transaction_result({:ok, result}), do: result
  defp unwrap_transaction_result(other), do: other
end
