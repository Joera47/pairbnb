class ListingsController < ApplicationController
	def index
		@listings = current_user.listings
	end

	def new
		@listing = Listing.new
		@read = false
	end

	def create #After submission of form in new, redirects straight to here. It's a rails thing
		@user = current_user
		@listing = @user.listings.new(listing_params)
		if @listing.save
			redirect_to listings_path
		else
			render :new
		end
	end

	def edit
		@listing = current_user.listings.find(params[:id])
		@read = false
	end

	def update
		@listing = Listing.find(params[:id])
		if @listing.update(listing_params)
			redirect_to listings_path
		else
			render :edit
		end
	end

	def show
		@listing = Listing.find(params[:id])
		@read = true
	end

	private
		def listing_params
			params.require(:listing).permit(:home_type, :room_type, :no_of_guest, :location, :price, :user_address, :no_of_bed, :no_of_bathroom, :description, :availability, :checkin, :checkout)
		end
end