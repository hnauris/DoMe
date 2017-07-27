class Group < ApplicationRecord
  belongs_to :augstskola
  has_many :users
  has_many :posts
end
