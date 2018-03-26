defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(<<c>> <> rest, shift) when c in ?a..?z do 
    <<?a + rem(c - ?a + shift, 26)>> <> rotate(rest, shift)
  end

  def rotate(<<c>> <> rest, shift) when c in ?A..?Z do
    <<?A + rem(c - ?A + shift, 26)>> <> rotate(rest, shift)
  end
  
  def rotate("", _), do: ""
  def rotate(<<c>> <> rest, shift), do: <<c>> <> rotate(rest, shift)
end
