defmodule PhoenixAppWeb.PageController do
  use PhoenixAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def send_fortune_cookie(%Plug.Conn{params: %{"name" => name, "email" => email, "topic" => topic}} = conn, _params) do

    # Generate Fortune Cookie
    {:ok, %{choices: choices}} = OpenAI.completions("text-davinci-003", prompt: "Tell me an elaborated fortune cookie about #{topic} with between at least 16 and max 24 words. Use double-quotes.", max_tokens: 36)
    %{"text" => fortune_cookie_prompt} = Enum.at(choices, 0)

    # Create Email
    email = PhoenixApp.PrepareEmail.create_fortune_cookie(name, email, fortune_cookie_prompt)

    # Send Email
    PhoenixApp.Mailer.deliver(email)
  
    render(conn, "send_fortune_cookie.html", name: name, topic: topic)
  end
end
