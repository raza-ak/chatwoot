class CreateFunnelCompuexpedientes < ActiveRecord::Migration[7.0]
  def change
    create_table :funnel_compuexpedientes do |t|
      t.references :account, null: false, foreign_key: true
      t.string :funnel_url, null: false, limit: 3000

      t.timestamps
    end
  end
end
