class CreateTestData < ActiveRecord::Migration[5.1]
  def change
    create_table :test_data do |t|
      t.string :name
      t.string :favorite_food
      t.string :favorite_drink
      t.timestamps
    end
  end
end
