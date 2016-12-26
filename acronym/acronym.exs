defmodule Acronym do

  @on_title_case_hyphens_and_spaces ~r{\s|-|(?<=[a-z])(?=[A-Z])}

  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(@on_title_case_hyphens_and_spaces)
    |> Enum.map(&String.first/1)
    |> Enum.join("")
    |> String.upcase
  end
end
