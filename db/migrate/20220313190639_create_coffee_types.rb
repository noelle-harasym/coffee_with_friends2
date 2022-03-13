class CreateCoffeeTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :coffee_types do |t|
      t.string :coffee_type

      t.timestamps
    end
  end
end
