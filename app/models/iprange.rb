class Iprange
	#TODO do validates use in method iprange.valid?
	#validates :iprange, :format => {:with => /\A(-?([0-1]\d?\d?|[2][0-4]\d|[2][5][0-5])\.?){4,8}\Z/}

	def createadd(address,iprange,descr)
		#there must be iprange.valid?
		@iprange=iprange
		if @iprange.include? ","
			@iprange.gsub!(",",".")
		end
		if @iprange =~ /\A(-?([0-1]?\d?\d?|[2][0-4]\d|[2][5][0-5])\.?){4,8}\Z/ 
			@iprange=@iprange.split(".")
			@iprange2=@iprange.collect {|octet|
				if octet.include? "-"
					octet=octet.split("-")
					range=(octet[0].to_i..octet[1].to_i)
					octet=range
				else
					range=Array.new(1,octet.to_i)
					octet=range
				end
				}
			puts @iprange2
			@iprange2[0].each {|octet1|
				@iprange2[1].each {|octet2|
					@iprange2[2].each {|octet3|
						@iprange2[3].each {|octet4|
							@tmpwaitadd=Waitaddress.new
							@tmpwaitadd.ipaddress="#{octet1}.#{octet2}.#{octet3}.#{octet4}"
							@tmpwaitadd.address=address
							@tmpwaitadd.descr=descr
							@tmpwaitadd.save
						}
					}
				}
			}
		end
	end
end
