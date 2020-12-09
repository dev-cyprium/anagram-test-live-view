defmodule AnagramApi.Anagram do
  @moduledoc """
  Documentation for `Anagram`.
  """

  @doc """
  Returns true if the substring of the first string can be arranged in the second string.

  ## Examples
      iex> AnagramApi.Anagram.does_include("A lot of words here", "tol")
      true

      iex> AnagramApi.Anagram.does_include("hey say something", "hss")
      true

      iex> AnagramApi.Anagram.does_include("nope", "nahah")
      false
  """
  def does_include(str1, str2)
    when is_binary(str1) and is_binary(str2) do
    characters = String.graphemes(str1)
    Enum.reduce(characters, str2, fn (c, acc) ->
      String.replace(acc, c, "", global: false)
    end)
    |> String.length()
    |> Kernel.==(0)
  end
end
