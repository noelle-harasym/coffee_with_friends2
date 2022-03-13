class AddUserReferenceToCoffeeOrders < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :coffee_orders, :users
    add_index :coffee_orders, :user_id
    change_column_null :coffee_orders, :user_id, false
  end
end
