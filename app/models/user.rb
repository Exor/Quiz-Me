class User < ActiveRecord::Base
	before_save { self.email = email.downcase } 
	before_save { self.name = name.downcase }
	validates :name, 
		presence: true, 
		length: { minimum: 6, maximum: 100 },
		format: { with: /[a-z0-9]/i },
		uniqueness: { case_sensitive: false }
	validates :email, 
		presence: true, 
		format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i },
		uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 8 }
end
