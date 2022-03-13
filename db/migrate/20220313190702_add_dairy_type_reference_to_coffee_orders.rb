class AddDairyTypeReferenceToCoffeeOrders < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :coffee_orders, :dairy_types
    add_index :coffee_orders, :dairy_type_id
    change_column_null :coffee_orders, :dairy_type_id, false
  end
end
