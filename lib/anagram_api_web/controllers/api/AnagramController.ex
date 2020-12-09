defmodule AnagramApiWeb.API.AnagramController do
  use AnagramApiWeb, :controller

  alias AnagramApi.Anagram

  @doc """
  POST /api/does-include

  Params: str1, str2 manditory

  Proxy to our internal function to do the calculation.
  """
  def does_include(conn, %{"str1" => str1, "str2" => str2}) do
    json conn, %{result: Anagram.does_include(str1, str2)}
  end
  def does_include(conn, _) do
    conn
    |> put_status(400)
    |> json(%{message: "Missing arguments [str1], [str2] in the request."})
  end
end
