class AddTypeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :ptype, :string
  end
end
