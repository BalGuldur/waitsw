class IprangeController < ApplicationController
	#GET
	def createadd
		@iprange=Iprange.new

		@iprange.createadd params[:address], params[:iprange], params[:descr]
		redirect_to :back
	end
end
