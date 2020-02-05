defmodule DbtestWeb.PageController do
  use DbtestWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
