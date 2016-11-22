defmodule Bob do
  def hey(input) do
    cond do
      String.ends_with?(input, "?") -> "Sure."
      String.trim(input) == "" -> "Fine. Be that way!"
      String.match?(input, ~r/[a-z\p{L}]/ui) && String.upcase(input) == input -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
