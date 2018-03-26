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
  def count(strand, nucleotide), do: count(strand, nucleotide, 0)
  def count([nucleotide | t], nucleotide, occ), do: count(t, nucleotide, occ + 1)
  def count([_ | t], nucleotide, occ), do: count(t, nucleotide, occ)
  def count([], nucleotide, occ), do: occ

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand), do: histogram(strand, 0, 0, 0, 0)
  def histogram([?T | tl], t, g, a, c), do: histogram(tl, t+1, g, a, c)
  def histogram([?G | tl], t, g, a, c), do: histogram(tl, t, g+1, a, c)
  def histogram([?A | tl], t, g, a, c), do: histogram(tl, t, g, a+1, c)
  def histogram([?C | tl], t, g, a, c), do: histogram(tl, t, g, a, c+1)
  def histogram([], t, g, a, c), do: %{ ?T => t, ?G => g, ?A => a, ?C => c}
end
