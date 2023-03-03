class CompaniesController < ApplicationController
  def index
    @companies = Company.includes(:industry, :sector).all.order("Rank_by_MarketCap")

  end

  def show
    @company = Company.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @companies = Company.where('name LIKE ?', wildcard_search)
  end
end
