defmodule PhoenixApp.PrepareEmail do
  use Phoenix.Swoosh, view: PhoenixAppWeb.EmailView

  def create_fortune_cookie(sender, email, fortune_cookie_prompt) do
    new()
    |> to({"someone", email})
    |> from({"Michael Szerman", "michaelszer@gmail.com"})
    |> subject("🥠 #{sender} sent you a Fortune Cookie")
    |> render_body("fortune_cookie.html", sender: sender, fortune_cookie_prompt: fortune_cookie_prompt)
  end
end