class AddThumbnailImgToProduct < ActiveRecord::Migration
  def change
    add_attachment :products, :thumbnail_img
  end
end
