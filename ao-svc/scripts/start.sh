cd $APP_DIR/apps/store
mix ecto.setup
mix ecto.seed

cd $APP_DIR/apps/svc
mix phoenix.server