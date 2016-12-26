defmodule SpaceAge do

  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    apply(SolarSystem, planet, [])
    |> EarthYears.calculate(seconds)
    |> Float.round(2)
  end
end

defmodule EarthYears do
  def calculate(period, seconds), do: seconds / (earth_year_secs * period)
  defp earth_year_secs, do: 31557600.0
end

defmodule SolarSystem do
  def mercury, do: 0.2408467
  def venus,   do: 0.61519726
  def earth,   do: 1.0
  def mars,    do: 1.8808158
  def jupiter, do: 11.862615
  def saturn,  do: 29.447498
  def uranus,  do: 84.016846
  def neptune, do: 164.79132
end
