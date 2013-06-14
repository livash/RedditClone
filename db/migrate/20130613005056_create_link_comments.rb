class CreateLinkComments < ActiveRecord::Migration
  def change
    create_table :link_comments do |t|
      t.integer :link_id
      t.integer :comment_id
      t.integer :parent_comment_id

      t.timestamps
    end
  end
end
