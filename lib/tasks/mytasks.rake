require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")

namespace :waitsw do
	desc "Ping all waitaddress in BD"
	task(:pingall => :environment) do
		while true do
			Waitaddress.all.each {|address|
				address.ping
				}
			sleep 20
		end
	end
	
	desc "run pingall as nohup with log"
	task :runpingall do
	 @start=`nohup rake waitsw:pingall 2>"#{File.expand_path(File.dirname(__FILE__) + "/../../log/pingall.log")}" &`
	end
end
