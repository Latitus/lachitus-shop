ActiveAdmin.register Product do
  permit_params :title, :description, :price, :thumbnail_img, :cover_img, :ptype, :size, :color
  #   pictures_attributes: [[:photo]]

  before_filter :only => [:show] do
    @product = Product.friendly.find(params[:id])
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
  # controller do
  #   def create
  #     @product = Product.new(product_params)
  #     if @product.save
  #       byebug
  #       @product.pictures.new(picture_params)
  #       redirect_to @product
  #     end
  #   end
  #
  #   def product_params
  #     params.require(:product).permit(:title, :description, :price, :thumbnail_img, :cover_img)
  #   end
  #
  #   def picture_params
  #     params.require(:product).fetch(:pictures_attributes)
  #   end
  # end

  form :html => {:multipart => true} do |f|
    f.inputs "Product detail" do
      f.input :title
      f.input :description
      f.input :price
      f.input :thumbnail_img, :required => false, :as => :file
      f.input :cover_img, :required => false, :as => :file
      # f.has_many :pictures do |ff|
      #   ff.input :photo, as: :file, input_html: { multiple: true}
      # end
      f.input :ptype, as: :select, collection: %w(belts handbags shoes accessories clothing bestselling collections), selected: 'belts'
      f.input :size, as: :select, collection: %w(medium large xlarge small one-size handbags), selected: 'medium', multiple: true
      f.input :color

      # Will preview the image when the object is edited
    end
    f.actions
  end

  show do |ad|
    attributes_table do
      row :title
      row :description
      row :price
      row :thumbnail_img do
        image_tag(ad.thumbnail_img.url(:medium))
      end
      row :cover_img do
        image_tag(ad.cover_img.url(:medium))
      end
      row :ptype
      # Will display the image on show object page
    end
  end

  index do
    id_column
    column :title
    column :description
    column :price
    column :thumbnail_img
    column :cover_img
    column :ptype
    actions
  end
end
