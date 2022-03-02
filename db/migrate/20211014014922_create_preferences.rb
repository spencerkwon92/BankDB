class CreatePreferences < ActiveRecord::Migration[6.1]
  def change
    create_table :preferences do |t|
      t.string :repayment_way
      t.float :interest_rate
      t.float :amount
      t.integer :period
      t.integer :user_id

      t.timestamps
    end
  end
end
