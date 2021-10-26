defmodule ApiWeb.DefaultController do
  use ApiWeb, :controller

  def index(conn, _params) do
    text conn, "ApiWeb!"
  end
end
