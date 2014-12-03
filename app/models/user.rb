class User < ActiveRecord::Base
  include BCrypt

  has_many :weights
  has_many :posts, through: :weights

  # validates :hashed_password, length: { minimum: 6 }

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(typed_password)
    Password.new(self.hashed_password) == typed_password
  end
end
