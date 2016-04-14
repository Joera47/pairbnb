class User < ActiveRecord::Base
	include Clearance::User

	has_many :authentications, :dependent => :destroy
	has_many :listings, :dependent => :destroy

	mount_uploader :avatar, AvatarUploader

	def self.create_with_auth_and_hash(authentication,auth_hash)
		create! do |u|
			name = auth_hash["info"]["name"]
			namesplit = name.split
			u.first_name = namesplit[0]
			u.last_name = namesplit[1]
			u.email = auth_hash["extra"]["raw_info"]["email"]
			u.authentications<<(authentication)
			u.encrypted_password = "dummy"
		end
	end

	def fb_token
		x = self.authentications.where(:provider => :facebook).first
		return x.token unless x.nil?
	end

	def password_optional?
		true
	end
end