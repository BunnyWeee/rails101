class Group < ApplicationRecord
  has_many :posts
  belongs_to :user
  has_many :group_users
  has_many :groups, through: :group_users
  # has_many :members, through: :group_users
end
