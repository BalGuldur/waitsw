class Waitaddressmailer < ActionMailer::Base
  default :from => "a.krylov@westcall.spb.ru"
	def upwaitsw(waitaddress)
	  @waitaddress=waitaddress
		mail(:to => "a.krylov@westcall.spb.ru",
					:subject => "[waitsw] #{waitaddress.ipaddress} is #{waitaddress.status}")
	end
end
