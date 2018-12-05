class Group < ApplicationRecord
  belongs_to :book
  belongs_to :creator, :class_name => "User"
  has_many :usergroup
  has_many :users, through: :usergroup
  has_one :discussion
  has_many :posts, through: :discussion
end
