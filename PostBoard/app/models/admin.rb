class Admin < ActiveRecord::Base
	### Admin
	# Gesus, 812330677777
	# God, e8d1E2D3EEE


	# presence
	validates :name, presence: true
	# validates :password, presence: true

	# length

	validates :name, length: { minimum: 2 }
	validates :name, length: { maximum: 200 }

	# validates :password, length: { minimum: 10 }
	# validates :password, length: { maximum: 15 }

	# unique
	validates :name, uniqueness: true
	# validates :password, uniqueness: true
	
	# Rails 內建的使用者認證功能：has_secure_password
	has_secure_password validation: false
end