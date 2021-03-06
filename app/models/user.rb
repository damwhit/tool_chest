class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true
  has_many :tools

  enum role: %w(default admin)
end
