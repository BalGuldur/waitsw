class Waitaddress < ActiveRecord::Base
	validates :address, :ipaddress, :presence => true
	validates :ipaddress, :format => {:with => /\A(([0-1]?\d?\d?|[2][0-4]\d|[2][5][0-5])\.?){4}\Z/}

  belongs_to :user
  
	def ping
		@strforping="ping -c 2 -i 0.2 -W 1 #{self.ipaddress} | grep received"
		@rezping=`#{@strforping}`
		@rezping=@rezping.split(" ")
		if ('1'..'4').include? @rezping[3]
			@status="online"
		else
			@status="offline"
		end
		if @status!=self.status
			self.status=@status
			self.save #save run post_update callback, where run mailer
			#TODO create mailer
			if @status=="online"
				Waitaddressmailer.upwaitsw(self).deliver
			end
		end
	end
end
