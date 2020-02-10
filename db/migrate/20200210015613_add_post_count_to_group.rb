class AddPostCountToGroup < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :posts_count, :integer, default: 0
  end
end
