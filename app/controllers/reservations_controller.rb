class ReservationsController < ApplicationController
	def index
		@reservations = Reservation.where(user_id: current_user.id)
	end

	def show
	end

	def new
		@listing = Listing.find(params[:listing_id].to_i)
		@reservation = Reservation.new
	end

	def create #After submission of form in new, redirects straight to here. It's a rails thing
		@reservation = Reservation.new(listing_params)
		if @reservation.save
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
	end

	def update
	end

	def destroy
		@reservation = Reservation.find(params[:id]).destroy
		redirect_to reservations_path
	end

	private
		def listing_params
			params.require(:reservation).permit(:listing_id, :user_id, :check_in, :check_out)
		end
end
