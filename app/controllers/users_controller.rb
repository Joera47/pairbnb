class UsersController < ApplicationController
	def index
		puts "Hello"
		puts ENV["facebook_email"]
		puts ENV["facebook_password"]
	end
end
