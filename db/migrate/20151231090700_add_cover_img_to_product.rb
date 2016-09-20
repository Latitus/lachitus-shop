class AddCoverImgToProduct < ActiveRecord::Migration
  def change
    add_attachment :products, :cover_img
  end
end
