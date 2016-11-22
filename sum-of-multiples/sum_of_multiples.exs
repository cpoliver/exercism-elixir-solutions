defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    1..(limit - 1)
    |> Enum.flat_map(fn number ->
      factors
      |> Enum.map(fn factor ->
        case is_factor?(number, factor) do
          true -> number
          false -> 0
        end
      end)
    end)
    |> Enum.uniq
    |> Enum.sum
  end

  def is_factor?(number, factor) do
    number >= factor && rem(number, factor) == 0
  end
end
