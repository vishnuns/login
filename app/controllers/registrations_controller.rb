class RegistrationsController < ApplicationController
	def index
	end
	
	def login
		username=params[:username]
		password=params[:password]
		user=Registration.where(:username=>username).first
		if user.password==password
			session[:username]=username
			flash[:notice]="Login Successful!"
			redirect_to :controller=>"registrations",:action=>"secret"
		else
			redirect_to :controller=>"registrations",:action=>"index",:error=>"Login Unsuccessful"
		end
	end
	def secret
	end
end
