# Server Sent Events Example

Points : 

1. Start GenServer https://github.com/codenoid/elixir-sse-example/blob/ab1721087029940f5be3dc96c664535c59a07b62/lib/sse_example/application.ex#L17
2. REST API HANDLER https://github.com/codenoid/elixir-sse-example/blob/ab1721087029940f5be3dc96c664535c59a07b62/lib/sse_example_web/controllers/page_controller.ex#L12
3. return some data from database, etc from https://github.com/codenoid/elixir-sse-example/blob/ab1721087029940f5be3dc96c664535c59a07b62/lib/sse_example_web/helpers/ticker.ex#L40
4. new data with automatically published to client (if point 2 only return static data, the data will not sent to client)

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
