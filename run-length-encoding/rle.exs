defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.codepoints
    |> Enum.reduce([], fn(letter, acc) ->
      letter_atom = cond do
        is_atom letter -> letter
        true -> String.to_atom letter
      end

      case List.last acc do
        {^letter_atom, last_letter_count} ->
          List.replace_at(acc, -1, {letter_atom, last_letter_count + 1})
        _ ->
          acc ++ [{letter_atom, 1}]
      end
    end)
    |> Enum.map_join("", fn {letter, count} -> "#{count}#{letter}" end)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.split(~r/[1-9]{1,}[A-Z]{1}/, string, include_captures: true, trim: true)
    |> Enum.map(fn letter_and_count ->
      [count_string, letter] = Regex.split ~r/^[1-9]{1,}/, letter_and_count, include_captures: true, trim: true
      count = String.to_integer count_string
      String.duplicate letter, count
    end)
    |> Enum.join
  end
end
