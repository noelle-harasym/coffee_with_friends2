class CreateDairyTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :dairy_types do |t|
      t.string :dairy_type

      t.timestamps
    end
  end
end
