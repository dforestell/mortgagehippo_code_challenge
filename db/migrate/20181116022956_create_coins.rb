class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :coins do |t|
    	t.string :name, null: false
    	t.integer :value, null: false
    	t.integer :quantity, default: 0

    	t.timestamps
    end
  end
end
