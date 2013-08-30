module DailiesHelper
	def basic_output(daily, attribute)
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

  def bp_output(daily, sys, dias)
  	if daily.nil? || (daily[sys].nil? && daily[dias].nil?)
  		""
  	elsif daily[sys].nil? && !daily[dias].nil?
  		" / #{daily[dias]}"
  	elsif !daily[sys].nil? && daily[dias].nil?
  		"#{daily[sys]} / "
  	else
  		"#{daily[sys]} / #{daily[dias]}"
  	end
	end

	def report_time(time)
		if time.nil?
			return ""
		else
			return time.strftime("%l:%M %p")
		end
	end

	def add_edit_button(daily)
		link_to "Edit", edit_daily_path(daily),
								class: "btn btn-primary" unless daily.nil?
	end
end
