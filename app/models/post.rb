class Post < ActiveRecord::Base
  has_many :weights
  has_many :users, through: :weights
end
