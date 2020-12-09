defmodule AnagramApiWeb.PageController do
  use AnagramApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
