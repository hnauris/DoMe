class Group < ApplicationRecord

  serialize :member_list, Array
  acts_as_followable
  belongs_to :augstskola
  has_many :users
  has_many :posts
end
