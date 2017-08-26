defmodule Rumbl.Repo do
  #use Ecto.Repo, otp_app: :rumbl

  def all(Rumbl.User) do
    [%Rumbl.User{id: "1", name: "José", username: "josevalim", password: "elixir"},
     %Rumbl.User{id: "2", name: "Bruce", username: "redrapids", password: "7langs"},
     %Rumbl.User{id: "3", name: "Chris", username: "chridmccord", password: "phx"}]
  end

  def all(_module), do: []

  def find(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def find_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end

