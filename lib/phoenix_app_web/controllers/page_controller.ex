defmodule PhoenixAppWeb.PageController do
  use PhoenixAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def send_fortune_cookie(%Plug.Conn{params: %{"name" => name, "email" => email, "topic" => topic}} = conn, _params) do
    render(conn, "send_fortune_cookie.html", name: name, email: email, topic: topic)
  end
end
