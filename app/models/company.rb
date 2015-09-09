require "bcrypt"

class Company < ActiveRecord::Base
	# attr_accssible :email, :name, :password
	#validate_presence_of :email, :name, :password
	validates_presence_of :name, :email, :password, :password_confirmation
	validates_uniqueness_of :email
	validates_length_of :password, minimum: 6
	validates_confirmation_of :password

	def password=(new_password)
		@password = new_password
		self.encrypted_password = BCrypt::Password.create(@password)		
	end

	def password
		@password		
	end
end
