class UpdateLinks < ActiveRecord::Migration
  def change
    add_column :links, :title, :string
    add_column :links, :text, :text
  end
end
