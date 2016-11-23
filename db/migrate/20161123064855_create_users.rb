class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :point, default: 0, null: false
      t.integer :x, default: 0, null: false
      t.integer :y, default: 0, null: false

      t.timestamps
    end
  end
end
