class DailiesController < ApplicationController
	before_action :get_daily, only: [:update, :edit]

	def edit
		session[:return_to] ||= request.referer
	end

	def update
		if @daily.update(daily_params)
			flash[:success] = "Report updated"
			redirect_to session.delete(:return_to)
		else
			render 'edit'
		end
	end

	private

		def daily_params
			params.require(:daily).permit(:am_weight, :am_systolic,
				:am_diastolic, :am_pulse, :am_temp, :am_meds)
		end

		def get_daily
			@daily = Daily.find(params[:id])
			redirect_to(root_url) unless @daily.user_id == current_user.id
		end

end