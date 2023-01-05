defmodule PhoenixApp.Telemetry.Email do
  require Logger
  
  def handler_event([:swoosh, :deliver, :stop], _measurements, metadata, _config) do
    if metadata[:error] do
      {error_code, %{error: %{message: error_message}}} = metadata[:error]
      Logger.error("Email failure. #{error_message}")
    else
      Logger.info("Email sent successfully.")
    end
  end
end