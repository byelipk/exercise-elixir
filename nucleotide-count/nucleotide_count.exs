defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    cond do
      !is_valid?({:strand, strand})         -> raise ArgumentError
      !is_valid?({:nucleotide, nucleotide}) -> raise ArgumentError
      true -> strand
              |> Enum.filter(fn x -> x == nucleotide end)
              |> Enum.count
    end
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    @nucleotides
      |> Enum.map(fn(x) -> %{x => count(strand, x)} end)
      |> Enum.reduce(%{}, fn(x, acc) -> Map.merge(acc, x) end)
  end

  defp is_valid?({:strand, strand}) do
    Enum.all?(strand, fn(x) -> is_valid?({:nucleotide, x}) end)
  end

  defp is_valid?({:nucleotide, nucleotide}) do
    Enum.member?(@nucleotides, nucleotide)
  end

end
