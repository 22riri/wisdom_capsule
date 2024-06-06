class AddTitleToMemories < ActiveRecord::Migration[7.1]
  def change
    add_column :memories, :title, :string
  end
end
