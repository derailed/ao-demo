# Australian Open GraphQL Demo Application

<img src="/assets/ao.png" width="400">

## Motivation

This sample demo provides an overview of a tennis championship application using
GraphQL queries to power the views. On the backend the GraphQL queries are served
up using an Phoenix/Elixir service. The application cluster is composed of the
following pieces orcherstrated via Kubernetes:

* [ao-ui] an angular2 front end application
* [ao-svc] an elixir GraphQL service
* [ao-db] a postgres database

## Presentation slides

[GraphQL The New Black?](http://www.slideshare.net/derailed/graphql-the-new-black-71435296)

## Requirements

* [Kubernetes CLI](kubernetes.io)
* [MiniKube](https://github.com/kubernetes/minikube)
* [Helm](https://github.com/kubernetes/helm)
* [Docker](https://www.docker.com)

## Installation

The preferred way to launch this cluster is by running the whole stack
locally using Minikube and Helm. The application is composed of the following
docker images:

* ao-db  (Postgres)
* ao-svc (Phoenix/Elixir)
* ao-ui  (Angular2)

## Launching the cluster

> NOTE: This assumes Minikube is installed and running!

> NOTE: At any stage type `make` to see all available tasks.

1. Build docker images

```shell
pushd ao-svc && make img
pushd ao-ui && make img
```

1. Setup helm

```shell
helm init
helm repo add local http:://localhost:8879
```

1. Setup db credentials

> NOTE: You need to setup your own db user/password. Copy the provided
  env.changeme.sh to env.sh and update the PG username and password.

```shell
source env.sh
```

1. Setup db credentials

```shell
make creds
```

1. Build your helm charts and launch helm local chart server

```shell
make hm-charts
make hm-serv
```

1. Start the database

```shell
make db-up
```

1. Launch the service and ui

```shell
make ao-up
```

1. Launch GraphiQL

```shell
make ao-iql
```

1. Launch the UI

```shell
make ao-open
```

1. Nuke the cluster

```shell
make nuke
```

## Comments?

Please feel free to drop us a line. If you've have comments or better ways to proceed we're all hears!

## Credits

Thanks to the [Apollo team](http://www.apollodata.com/) for making client side GraphQL management a breeze.

Also big thanks to our good friends [Bruce Willams + Ben Wilson](http://absinthe-graphql.org/) for once
again dropping some good stuff on us via [Absinthe](http://absinthe-graphql.org/)

## License

[Imhotep Sofware LLC](http://imhotep.io) is releasing this sample code under [MIT](https://opensource.org/licenses/MIT) license.