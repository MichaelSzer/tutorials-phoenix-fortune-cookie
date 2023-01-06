defmodule PhoenixAppWeb.PageController do
  use PhoenixAppWeb, :controller

  @recommended_topics ["mbappe & a turtle", "unicorns", "harry potter", "meme stocks", "croissant", "ice-cream", "aliens", "the art of war", "italians"]

  def index(conn, _params) do
    render(conn, "index.html", recommended_topics: @recommended_topics)
  end

  def send_fortune_cookie(%Plug.Conn{params: %{"sender" => sender, "email" => email, "topic" => topic}} = conn, _params) do

    # Generate Fortune Cookie
    {:ok, %{choices: choices}} = OpenAI.completions("text-davinci-003", prompt: "Tell me a silly fortune cookie about #{topic} between at least 20 and max 24 words. Use double-quotes.", max_tokens: 54)
    %{"text" => fortune_cookie_prompt} = Enum.at(choices, 0)

    # Create Email
    email = PhoenixApp.PrepareEmail.create_fortune_cookie(sender, email, fortune_cookie_prompt)

    # Send Email
    PhoenixApp.Mailer.deliver(email)
  
    render(conn, "send_fortune_cookie.html", name: "none", topic: topic)
  end
end
