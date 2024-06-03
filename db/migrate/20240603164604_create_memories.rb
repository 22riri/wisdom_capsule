class CreateMemories < ActiveRecord::Migration[7.1]
  def change
    create_table :memories do |t|
      t.text :text
      t.date :date_of_memory
      t.references :memorybox, null: false, foreign_key: true

      t.timestamps
    end
  end
end
