defmodule Scrabble do
  @letter_scores %{
    1 => ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
    2 => ['D', 'G'],
    3 => ['B', 'C', 'M', 'P'],
    4 => ['F', 'H', 'V', 'W', 'Y'],
    5 => ['K'],
    8 => ['J', 'X'],
   10 => ['Q', 'Z']
  }

  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase
    |> String.trim
    |> String.split("", trim: true)
    |> Enum.reduce(0, fn (char, total_score) ->
      { letter_score, _ } = @letter_scores
                     |> Enum.find({0, []}, fn {score, letters} ->
                        Enum.any?(letters, fn letter -> to_string(letter) == char end)
                     end)

      total_score + letter_score
    end)
  end
end
