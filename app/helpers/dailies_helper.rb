module DailiesHelper
	def format_output(daily, attribute)
		if daily.nil?
			""
		else
			if daily[attribute].nil?
				""
			else
				daily[attribute]
			end
		end
	end

	def time_output(daily, attribute)
		if daily.nil?
			""
		else
			if daily[attribute].nil?
				""
			else
				daily[attribute].strftime("%l:%M %p")
			end
		end
  end

end
