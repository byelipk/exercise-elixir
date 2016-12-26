defmodule Words do

  import Enum,   only: [ reduce: 3, member?: 2 ]
  import String, only: [ downcase: 1, split: 1 ]
  import Map,    only: [ update: 4 ]

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) when is_binary(sentence) do
    filter(sentence)
    |> downcase
    |> split
    |> reduce(%{}, fn word, acc -> update(acc, word, 1, &(&1 + 1)) end)
  end

  defp filter(string), do: for << g <- string >>, into: "", do: do_codepoint(g)

  defp do_codepoint(g) when g >= 65 and g <= 90,  do: <<g>>  # A-Z
  defp do_codepoint(g) when g >= 97 and g <= 122, do: <<g>>  # a-z
  defp do_codepoint(g) when g >= 48 and g <= 57,  do: <<g>>  # 0-9
  defp do_codepoint(g) when g == 45,              do: <<g>>  # Hyphen
  defp do_codepoint(g) when g >= 127,             do: <<g>>  # Extended ASCII & Unicode
  defp do_codepoint(_),                           do: <<32>> # Space
end
