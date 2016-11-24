class User < ActiveRecord::Base
	###User
	# Tom,1111
	# Jason,22223

	has_many :posts
	has_many :comments

	has_secure_password validation: false
	
	# presence
	validates :name, presence: true
	# validates :password_digest, presence: true

	# length

	validates :name, length: { minimum: 2 }
	validates :name, length: { maximum: 200 }

	# validates :password_digest, length: { minimum: 4 }
	# validates :password_digest, length: { maximum: 10 }

	# unique
	validates :name, uniqueness: true
	# validates :password_digest, uniqueness: true

end