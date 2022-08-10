defmodule GluckshausWeb.PageController do
  use GluckshausWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
