defmodule Apus.TwilioAdapter do
  @moduledoc """
  """

  @behaviour Apus.Adapter

  alias ExTwilio.Message

  def deliver(message, config) do
    message
    |> Map.from_struct()
    |> maybe_put_service_sid(config)
    |> Message.create()
  end

  def handle_config(config), do: config

  defp maybe_put_service_sid(%{from: from} = message, %{messaging_service_sid: sid})
       when from in [nil, ""] do
    Map.put(message, :messaging_service_sid, sid)
  end

  defp maybe_put_service_sid(message, _config), do: message
end
