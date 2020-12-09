defmodule AnagramApiWeb.AnagramLive do
  use Phoenix.LiveView
  use Phoenix.HTML

  alias AnagramApi.Anagram

  def mount(_, _, socket) do
    {:ok, assign(socket, %{page_title: "Process page", processing_result: nil, str1: "", str2: ""})}
  end

  def is_empty_str(str) do
    String.trim(str) |> Kernel.==("")
  end

  def handle_event("save", %{"input" => %{"str1" => str1, "str2" => str2}}, socket) do
    {:noreply, assign(socket,
      %{
        processing_result: Anagram.does_include(str1, str2),
        str1: str1,
        str2: str2
      })
    }
  end

  def handle_event("change", %{"input" => %{"str1" => str1, "str2" => str2}}, socket) do
    {:noreply, assign(socket, %{str1: str1, str2: str2})}
  end
end
