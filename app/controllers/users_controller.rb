#encoding: utf-8
class UsersController < ApplicationController
  before_filter :have_access
  
  protected
  	def have_access
  		@current_page = :user
			redirect_to :root if current_user == nil
  	end
  	
  def new
	  @user = User.new
	end

	def create
		@user = User.new(params[:user])
		params[:user][:role_id].each do |r|
				@user.roles << Role.find(r)
		end				  
		if @user.save
			redirect_to action: "new", :notice => "Успешно зарегистрирован!"
		  #redirect_to root_url, :notice => "Успешно зарегистрирован!"
		else
		  render "new"
		end
	end
	
	def edit
		@user = User.find(params[:id])
		respond_to do |format|
			 	format.js {render :layout=>false}
		end
	end

	def ch_pass
		current_user.pass = params[:pass]
		current_user.save
		redirect_to 'new', :notice => "Пароль успешно изменен!"
	end
	
	def update 
		#@user.update_attributes(params[:user])
		@user = User.find(params[:id])
		@user.name = params[:user][:name];
		@user.pass = params[:user][:pass];
		@user.roles = []
		if params[:user][:role_id] != nil
			params[:user][:role_id].each { |r| @user.roles << Role.find(r) }
		end
		@user.save
		redirect_to action: 'new'
	end
end
