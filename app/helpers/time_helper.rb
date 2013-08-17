module TimeHelper

	def report_time(time)
		if time.nil?
			return ""
		else
			return time.strftime("%l:%M %p")
		end
	end

end