module DailiesHelper
	def format_output(daily, attribute)
		if daily.nil? || daily[attribute].nil?
			""
		else
			daily[attribute]
		end
	end

	def time_output(daily, attribute)
		if daily.nil? || daily[attribute].nil?
			""
		else
			daily[attribute].strftime("%l:%M %p")
		end
  end

  def nap_output(daily)
  	if daily.nil? || daily[:nap].nil?
  		""
  	elsif daily[:nap] == true
  		"Yes"
  	else
  		"No"
  	end
  end

end
