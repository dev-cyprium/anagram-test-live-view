defmodule AnagramApiWeb.AnagramLiveTest do
  use AnagramApiWeb.ConnCase
  import Phoenix.ConnTest
  import Phoenix.LiveViewTest
  @endpoint AnagramApiWeb.Endpoint

  test "initially, doesn't show the message", %{conn: conn} do
    conn = get(conn, "/")
    refute html_response(conn, 200) =~ "The characters from first string"

    {:ok, _, html} = live(conn)
    refute html =~ "The characters from first string"
  end

  test "shows the message when the user subits the form (true)", %{conn: conn} do
    {:ok, view, _} = live(conn, "/")

    html = render_submit(view, :save, %{input: %{str1: "d", str2: "d"}})
    assert html =~ "The characters from first string can be arranged in the second string!"
  end

  test "shows the message when the user subits the form (false)", %{conn: conn} do
    {:ok, view, _} = live(conn, "/")

    html = render_submit(view, :save, %{input: %{str1: "d", str2: "a"}})
    assert html =~ "The characters from first string cannot be arranged in the second string!"
  end
end
