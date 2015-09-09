class CompaniesController < ApplicationController
  
	
	def new
		@company = Company.new
	end
	
	def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to root_path, notice: 'company was successfully created.' }
        
      else
        format.html { render :new }
        
      end
    end
  end
	
	private
    def company_params
      params.require(:company).permit(:name, :email, :password, :password_confirmation)
    end

	
end