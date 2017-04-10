# Welcome Controller
class PurchasesController < ApplicationController
  #before_action :authenticate_user!
  
  def index
    @purchases = OrderItem.where(user_id: current_user).paginate(page: params[:page], per_page: 5)
  end

  def showprofile
  	@profile = User.find(params[:id])
    authorize! :editprofile, @profile
  	
  end

  def editprofile
    #debugger
    @user = User.find(params[:id])
    authorize! :editprofile, @user
  	
  end

  def update
    if can? :update, user
      respond_to do |format|
      	@user = User.find(params[:id])
        if @user.update(user_params)
          format.html { redirect_to show_user_path, notice: 'Product detail was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end
private
  def user_params
    params.require(:user).permit(:name, :phoneno, :address)
  end

end