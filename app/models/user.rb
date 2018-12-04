class User < ApplicationRecord
  has_many :usergroups
  has_many :groups, through: :usergroup
  has_many :groups, :foreign_key => "creator_id"




end
