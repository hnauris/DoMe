class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable, :confirmable

  has_many :comments
  has_many :posts
  belongs_to :group, optional: true
  acts_as_follower
end
