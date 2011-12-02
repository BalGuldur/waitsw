class WaitaddressController < ApplicationController
	def index
		@waitaddresses=Waitaddress.order("status").reverse_order
	end

	# DELETE /waitaddress/1
	def destroy
		@waitaddress = Waitaddress.find(params[:id])
		@waitaddress.destroy
		redirect_to :back
	end
end
