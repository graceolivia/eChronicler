
defmodule EChroniclerWeb.HelloController do
  use EChroniclerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end