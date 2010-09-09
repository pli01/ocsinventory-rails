module HardwaresHelper

 def get_percentage(a, b)
	 if (a.to_i > b.to_i || b.to_i == 0)
		 return 100
	 end
	 (a.to_f/b.to_f * 100).to_i
 end


end
