class IndustriesController < ApplicationController
  def index
    @industries = Industry.select("industries.*")
                          .select("COUNT(industries.id) as company_count")
                          .left_joins(:companies)
                          .group("industries.id")
                          .order("industries.name")
  end

  def show
    @industry = Industry.find(params[:id])
    @companies = @industry.companies.order("Rank_by_MarketCap")
  end
end
