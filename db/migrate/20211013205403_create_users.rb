class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date :birth_day
      t.string :phone
      t.string :password

      t.timestamps
    end
  end
end
