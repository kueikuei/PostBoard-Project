class User < ActiveRecord::Base
	###User
	# Tom,1111
	# Jason,2222



	has_many :posts
	has_many :comments

	has_secure_password validation: false
	


	# # presence
	# validates :name, presence: true
	# validates :password, presence: true

	# # length

	# validates :name, length: { minimum: 2 }
	# validates :name, length: { maximum: 200 }

	# validates :password, length: { minimum: 10 }
	# validates :password, length: { maximum: 10 }

	# # unique
	# validates :name, uniqueness: true
	# validates :password, uniqueness: true


	
end