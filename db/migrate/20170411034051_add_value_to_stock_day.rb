class AddValueToStockDay < ActiveRecord::Migration[5.0]
  def change
    add_column :stock_days, :value, :double
  end
end
