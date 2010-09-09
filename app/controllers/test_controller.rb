class TestController < ApplicationController
	def list
	  domain = params[:q]
          
          if domain == ""
            @all_hardware = Hardware.find(:all)
            else
            @all_hardware = Hardware.find(:all,:conditions => [ "WORKGROUP = ?", params[:q]]  )
          end
	end
end
