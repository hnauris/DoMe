class Group < ApplicationRecord

  acts_as_followable
  belongs_to :augstskola
  has_many :users
  has_many :posts
  validates :name, length: {maximum: 20}
end
