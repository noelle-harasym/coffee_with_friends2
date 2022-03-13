class AddCoffeTypeReferenceToCoffeeOrders < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :coffee_orders, :coffee_types, column: :coffe_type_id
    add_index :coffee_orders, :coffe_type_id
    change_column_null :coffee_orders, :coffe_type_id, false
  end
end
