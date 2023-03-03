class SectorsController < ApplicationController
  def index
    @sectors = Sector.select("sectors.*")
    .select("COUNT(sectors.id) as company_count")
    .left_joins(:companies)
    .group("sectors.id")
    .order("sectors.name")
  end

  def show
    @sector = Sector.find(params[:id])
    @companies = @sector.companies.order("Rank_by_MarketCap")
  end
end
