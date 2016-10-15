defmodule Founders.FacebookData do

  @derive [Poison.Encoder]
  defstruct [
    :ad_name, 
    :clicks, 
    :ad_id, 
    :campaign_name,
    :cpc,
    :spend,
    :adset_id,
    :adset_name,
    :campaign_id
  ]

  def filter_by_project_name(ads_data, name) do
    Enum.filter(ads_data, fn(ad) -> match_ad_name(ad, name) end)
  end

  defp match_ad_name(ad, name) do
    String.contains? ad.ad_name, name
  end

end
