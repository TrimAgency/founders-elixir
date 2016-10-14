defmodule Founders.FacebookDataTest do
  use ExUnit.Case
  doctest Founders.FacebookData

  test "Filter by project name" do
    file = File.cwd! 
      |> Path.join("facebook_response.json") 
      |> File.read!

    %{"data" => json} = Poison.decode! ~s({"data": #{file}}), as: %{"data" => [%Founders.FacebookData{}]}

    filtered = Founders.FacebookData.filter_by_project_name(json, "Rentlit")
    ad = Enum.at(filtered, 0)

    assert 1 == Enum.count filtered
    assert "Rentlit" == ad.ad_name
  end
end
