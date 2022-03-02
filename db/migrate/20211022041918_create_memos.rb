class CreateMemos < ActiveRecord::Migration[6.1]
  def change
    create_table :memos do |t|
      t.text :body
      t.integer :preference_id

      t.timestamps
    end
  end
end
