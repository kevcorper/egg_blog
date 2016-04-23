class User < ActiveRecord::Base
	has_secure_password

	validates :name, presence: true
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true

	has_many :posts, foreign_key: :author_id
	has_many :comments
end
