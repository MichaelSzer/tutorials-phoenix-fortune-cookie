defmodule PhoenixApp.PrepareEmail do
  use Phoenix.Swoosh, view: PhoenixAppWeb.EmailView

  def create_fortune_cookie(name, email) do
    new()
    |> to({name, email})
    |> from({"Michael Szerman", "michaelszer@gmail.com"})
    |> subject("Fortune Cookie🥠")
    |> render_body("fortune_cookie.html")
  end
end