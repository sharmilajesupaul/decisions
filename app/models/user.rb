class User < ActiveRecord::Base
  has_many :weights
  has_many :posts, through: :weights
end
