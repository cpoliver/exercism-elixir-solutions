defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace(~r/\p{P}/, "")
    |> String.replace(~r/([a-z])([A-Z])/, "\\1 \\2")
    |> String.split
    |> Enum.map(fn w -> String.at(w, 0) end)
    |> Enum.join("")
    |> String.upcase
  end
end
