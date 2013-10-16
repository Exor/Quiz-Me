class User < ActiveRecord::Base
	before_save { self.email = email.downcase } 
	before_save { self.name = name.downcase }
	before_create :create_remember_token
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
	
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end
	
	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end
	
	private
		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end
end
