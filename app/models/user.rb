class User < ApplicationRecord
	has_secure_password
	validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

	def self.from_omniauth(auth)
		where(email: auth.info.email).first_or_initialize do |user|
		  user.name = auth.info.name
		  user.email = auth.info.email
		  user.password_digest = SecureRandom.hex
		end
	end
end
