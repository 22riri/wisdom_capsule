class CreateMemoryboxes < ActiveRecord::Migration[7.1]
  def change
    create_table :memoryboxes do |t|
      t.string :title
      t.references :timecapsule, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
