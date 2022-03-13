class CreateCoffeeOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :coffee_orders do |t|
      t.integer :coffe_type_id
      t.integer :dairy_type_id
      t.boolean :iced
      t.text :modifications_other
      t.integer :rating
      t.string :picture
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
