defmodule Bob do
  def hey(input) do
    input = String.trim(input)

    cond do
      String.length(input) == 0                       -> Response.silence
      String.equivalent?(input, String.upcase(input)) ->
        cond do
          String.ends_with?(input, "?")               -> Response.ok
          byte_size(input) > String.length(input)     -> Response.chill
          String.match?(input, ~r/[a-zA-Z]/) == false -> Response.apathetic
          true                                        -> Response.chill
        end
      String.ends_with?(input, "?")  -> Response.ok
      true                           -> Response.apathetic
    end
  end
end

defmodule Response do
  def silence, do: "Fine. Be that way!"
  def apathetic, do: "Whatever."
  def ok, do: "Sure."
  def chill, do: "Whoa, chill out!"
end
