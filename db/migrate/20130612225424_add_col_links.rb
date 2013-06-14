class AddColLinks < ActiveRecord::Migration
  def change
    add_column :links, :author_id, :string
  end
end
