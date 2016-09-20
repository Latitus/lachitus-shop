class AddSizeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :size, :integer, default: 0
  end
end
