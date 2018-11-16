class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
    	t.string :type, null: false
    	t.string :coin_type, null: false
    	t.integer :user_id

    	t.timestamps
    end
  end
end
