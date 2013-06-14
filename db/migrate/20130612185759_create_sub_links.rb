class CreateSubLinks < ActiveRecord::Migration
  def change
    create_table :sub_links do |t|
      t.integer :link_id
      t.integer :sub_id

      t.timestamps
    end
  end
end
