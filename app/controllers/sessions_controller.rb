#encoding: utf-8
class SessionsController < ApplicationController
  before_filter :have_access
  
  protected
  	def have_access
  		@current_page = :session
  	end
  
  def new
	end

	def create
		user = User.authenticate(params[:name], params[:pass])
		if user
		  session[:user_id] = user.id
		  
		  if user.roles.find_by_name('super_admin')!=nil
		  	redirect_to sign_up_url
		  	
		  elsif user.roles.find_by_name('manager')!=nil || user.roles.find_by_name('director')!=nil
				redirect_to specs_path
				
			else		   
		  	redirect_to root_url, :notice => "Вы успешно вошли!"
		  end	
		  
		else
		  flash.now.alert = "Неправильное имя или пароль"
		  render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Вы успешно вышли!"
	end

end
