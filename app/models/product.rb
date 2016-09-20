# == Schema Information
#
# Table name: products
#
#  id                         :integer          not null, primary key
#  title                      :string
#  description                :text
#  price                      :float
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  thumbnail_img_file_name    :string
#  thumbnail_img_content_type :string
#  thumbnail_img_file_size    :integer
#  thumbnail_img_updated_at   :datetime
#  cover_img_file_name        :string
#  cover_img_content_type     :string
#  cover_img_file_size        :integer
#  cover_img_updated_at       :datetime
#  ptype                      :string
#  slug                       :string
#  size                       :integer          default(0)
#  color                      :string
#

class Product < ActiveRecord::Base
  has_attached_file :thumbnail_img, :styles => { :medium => "364x503>", :thumb => "100x100>" }
  has_attached_file :cover_img, :styles => { :large => "1024x768>", :medium => "640x320>" }
  validates_attachment :thumbnail_img, content_type: { content_type:     ["image/jpg", "image/jpeg", "image/png"] }
  validates_attachment :cover_img, content_type: { content_type:     ["image/jpg", "image/jpeg", "image/png"] }

  has_many :pictures
  accepts_nested_attributes_for :pictures, allow_destroy: true

  validates :ptype, inclusion: { in: %w(belts handbags shoes accessories clothing bestselling collections) }

  extend FriendlyId
  friendly_id :title, use: :slugged

  enum size: { "medium" => 0, "large" => 1, "xlarge" => 2, "small" => 3, "one-size" => 4, "handbags" => 5}

  def cart_action(current_user_id)
    if $redis.sismember "cart#{current_user_id}", id
      "Remove from"
    else
      "Add to"
    end
  end
end
