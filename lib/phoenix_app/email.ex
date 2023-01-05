defmodule PhoenixApp.PrepareEmail do
  use Phoenix.Swoosh, view: PhoenixAppWeb.EmailView

  def create_fortune_cookie(name, email, fortune_cookie_prompt) do
    new()
    |> to({name, email})
    |> from({"Michael Szerman", "michaelszer@gmail.com"})
    |> subject("Fortune Cookie🥠")
    |> render_body("fortune_cookie.html")
    #|> render_body("fortune_cookie.html", %{fortune_cookie_prompt: fortune_cookie_prompt})
    #<%= @fortune_cookie_prompt %>
  end
end