class CreateBanks < ActiveRecord::Migration[6.1]
  def change
    create_table :banks do |t|
      t.string :name
      t.integer :assets
      t.integer :employees
      t.string :location

      t.timestamps
    end
  end
end
