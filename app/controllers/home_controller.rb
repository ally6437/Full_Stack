class HomeController < ApplicationController
  def index
    @companies = Company.includes(:industry, :sector).order("Rank_by_MarketCap").limit(100)
    #@industries = Industry.limit(10)
  end
end
