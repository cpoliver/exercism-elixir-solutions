defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    result = "#{pling? number}#{plang? number}#{plong? number}"

    case result do
      "" -> to_string number
      _  -> result
    end
  end

  defp is_factor(number, factor) do
    rem(number, factor) == 0
  end

  defp pl_ng?(number, factor, if_true) do
    case is_factor number, factor do
      true -> if_true
      false -> ""
    end
  end

  defp pling?(number), do: pl_ng? number, 3, "Pling"
  defp plang?(number), do: pl_ng? number, 5, "Plang"
  defp plong?(number), do: pl_ng? number, 7, "Plong"
end
