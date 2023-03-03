require 'csv'

Company.delete_all
Industry.delete_all
Sector.delete_all

filename = Rails.root.join("db/nasdaq.csv")
puts "Loading Nasdaq companies from the csv file: #{filename}"

csv_data = File.read(filename)
companies = CSV.parse(csv_data, headers:true, encoding: "utf-8")

companies.each do |m|
  industry = Industry.find_or_create_by(name: m['industry'])
  if industry && industry.valid?
    sector = Sector.find_or_create_by(name: m['sector'])
    if sector && sector.valid?
      company = Company.create(
        name: m["name"],
        symbol: m["symbol"],
        price: m["price"],
        beta: m["beta"],
        eps: m["EPS"],
        share_volume: m["share_volume"],
        market_cap: m["market_cap"],
        rank_by_marketCap: m["Rank_by_MarketCap"],
        sector: sector,
        industry: industry
     )
    # if company&.valid?

     # sector = Sector.find_or_create_by(name: m['sector'])
    #  company.sector = sector
    #  sector.save
    # else
      puts "invalid company #{m['name']}" unless company&.valid?
      puts company.errors.full_messages
    else
    puts "invalid sector #{m["sector"]} for company #{m['name']}."
  end
else
  puts "invalid industry #{m["industry"]} for company #{m['name']}."
end
end
puts "Created #{Industry.count} industries"
puts "Created #{Sector.count} sectors"
puts "Created #{Company.count} companies."

