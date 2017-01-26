FROM msaraiva/elixir-dev:1.3.4

ENV MIX_ENV   prod
ENV APP_DIR   /app
ENV HTTP_PORT 4000

WORKDIR $APP_DIR
ADD . $APP_DIR

RUN set -ex ;\
    apk --no-cache add --virtual .build.deps libc-dev gcc make erlang-xmerl ;\
    mix local.hex --force ;\
    mix deps.get ;\
    mix deps.compile ;\
    mix compile ;\
    mix phoenix.digest ;\
    apk del .build.deps

EXPOSE $HTTP_PORT
ENTRYPOINT $APP_DIR/scripts/start.sh