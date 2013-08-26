module DailiesHelper
	def format_output(daily, attribute)
		if daily.nil?
			""
		else
			daily[attribute]
		end
	end
end
