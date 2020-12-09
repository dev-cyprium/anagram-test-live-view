defmodule AnagramApiWeb.API.AnagramControllerTest do
  use AnagramApiWeb.ConnCase

  describe "it works successfully" do
    test "when sent proper data returns true", %{conn: conn} do
      conn = post(conn, "/api/anagram/does-include", %{str1: "a cool string", str2: "acoos"})
      assert %{"result" => true} = json_response(conn, 200)
    end

    test "when sent proper data returns false", %{conn: conn} do
      conn = post(conn, "/api/anagram/does-include", %{str1: "nah, I don't think so", str2: "nope"})
      assert %{"result" => false} = json_response(conn, 200)
    end
  end

  describe "it gives 400" do
    test "when sending wrong arguments", %{conn: conn} do
      conn = post(conn, "/api/anagram/does-include")
      assert json_response(conn, 400)
    end
  end
end
