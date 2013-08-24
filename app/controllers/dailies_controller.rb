class DailiesController < ApplicationController
	before_action :get_daily, only: [:update, :edit]

	def edit
	end

	def update
		if @daily.update(daily_params)
			flash[:success] = "Report updated"
			redirect_to root_url
		else
			render 'edit'
		end
	end

	private

		def daily_params
			params.require(:daily).permit(:am_weight)
		end

		def get_daily
			@daily = Daily.find(params[:id])
			redirect_to(root_url) unless @daily.user_id == current_user.id
		end

end