class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.text :name
      t.text :interest
      t.text :repayment_way
      t.text :period
      t.integer :bank_id

      t.timestamps
    end
  end
end
