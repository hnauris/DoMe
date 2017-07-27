class Group < ApplicationRecord
  belongs_to :augstskola
  has_many :users, :posts
end
