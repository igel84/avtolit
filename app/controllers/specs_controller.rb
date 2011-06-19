#encoding: utf-8
class SpecsController < ApplicationController
  before_filter :have_access
  
  protected
  	def have_access 
  		@current_page = :spec
  		if current_user == nil
	  		redirect_to :root
	  	else
				redirect_to :root if !current_user.can?('spec')
			end
  	end
  	
  def index
  	@specs = Spec.find(:all, :order => "created_at DESC") || Spec.new
  end
  
  def new
  	@spec = Spec.new
  	respond_to do |format|
    	format.js {render :layout=>false}
    end   
  end
  
  def create
  	@spec = Spec.new(params[:spec])
  	@firm = Firm.new(params[:firm])
  	@spec.firm = @firm
  	@spec.user = current_user  	
  	
  	#
  	#если есть вложение, переходим на new, иначе через ajax
  	#
  	if params[:calc] != nil
			@calc = Calc.new(params[:calc])
			@spec.calcs << @calc
			@spec.save
			redirect_to specs_path
		else		
			if !@spec.save
				@message = "Ошибка при сохранении"
			else
				@message = "Запись успешно сохранена"
			end
				
			respond_to do |format|
			 	format.js {render :layout=>false}
			end
		end
  end
  
  def show
  	@spec = Spec.find(params[:num_spec])
  	if current_user.can? @spec
			respond_to do |format|
			 	format.js {render :layout=>false}
			end
		else
			render 'show2'
		end  	
  end
  
  def update
  	@firm = Firm.new(params[:firm])
  	@spec = Spec.find(params[:spec][:id])
  	if (@spec.firm == nil or @spec.firm != @firm)
  		@spec.firm = @firm
  	end
  	@spec.price = params[:spec][:price]
  	@spec.tender = params[:spec][:tender]
  	
  	@spec.bronza = params[:spec][:bronza]
  	@spec.chugun = params[:spec][:chugun]
  	@spec.meh_yes = params[:spec][:meh_yes]
  	@spec.meh_no = params[:spec][:meh_no]
  	@spec.cher_yes = params[:spec][:cher_yes]
  	
  	#
  	#если есть вложение, переходим на new, иначе через ajax
  	#
  	if params[:calc] != nil
			@calc = Calc.new(params[:calc])
			@spec.calcs << @calc
			@spec.save
			redirect_to specs_path
		else
			if !@spec.save
				@message = "Ошибка при сохранении"
			else
				@message = "Запись успешно сохранена"
			end
			respond_to do |format|
			 	format.js {render :layout=>false}
			end
			#@spec.update_attributes(params[:spec])
		end
  end
  
end
