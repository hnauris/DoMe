class Post < ApplicationRecord
  belongs_to :user, :group
  has_many :comments
end
