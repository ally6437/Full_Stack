class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :symbol
      t.decimal :price
      t.decimal :beta
      t.integer :share_volume
      t.decimal :eps
      t.integer :market_cap
      t.integer :rank_by_marketCap
      t.references :sector, null: false, foreign_key: true
      t.references :industry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
