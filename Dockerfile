FROM elixir:1.12.2

RUN apt-get update && \
    apt-get install -y postgresql-client

COPY api/ /app
COPY entrypoint.sh /app

WORKDIR /app

RUN mix local.hex --force

RUN mix do compile

CMD ["/app/entrypoint.sh"]
