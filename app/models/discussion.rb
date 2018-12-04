class Discussion < ApplicationRecord
  belongs_to :group
  has_many :posts
end
