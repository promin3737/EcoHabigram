class RenamePostIdColumnToLikes < ActiveRecord::Migration[5.2]
  def change
    rename_column :likes, :post_id, :post_image_id
  end
end
