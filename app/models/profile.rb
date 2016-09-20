# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  address    :string
#  user_name  :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#

class Profile < ActiveRecord::Base
  belongs_to :user
  extend FriendlyId
  friendly_id :user_name, use: :slugged
end
