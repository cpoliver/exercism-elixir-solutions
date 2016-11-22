defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    words =
      sentence
      |> String.downcase
      |> String.replace("_", " ")
      |> String.replace(~r/[:,.!?^&%£$@']/, "")
      |> String.split(~r/\s{1,}/)

    Enum.reduce words, Map.new, fn(word, acc) ->
      Map.put(acc, word, count(words, word))
    end
  end

  defp count(words, word) do
    Enum.count words, fn w -> w == word end
  end
end
