# Registration Controller inherited Devise RegistrationController
class RegistrationsController < Devise::RegistrationsController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /pps
  # GET /pps.json
  def index
    @user = User.all
  end

  # GET /pps/1
  # GET /pps/1.json
  def show
    render :text => "hello"
  end

  # GET /pps/new
  def new
    @user = User.new
  end

  # GET /pps/1/edit
  def edit  
    # edit method
  end


  def showprofile
    @profile = User.find(params[:id])
    
  end

  def editprofile
    @user = User.find(params[:id])
    
  end

  

  # POST /pps
  # POST /pps.json
  def create
    @user = User.new(user_params)
   if @user.save
         flash[:notice] = "Data saved successfully"
         redirect_to user_session_path
    else
        flash[:notice] = "Data not saved"
        redirect_to new_user_session_path
    end
  
  end

  def update
    respond_to do |format|
      @user = User.find(params[:id])
      if @user.update(update_params)
        format.html { redirect_to show_user_path, notice: 'Product detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PATCH/PUT /pps/1
  # # PATCH/PUT /pps/1.json
  # def update
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.html { redirect_to @user, notice: 'Pp was successfully updated.'}
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @user.errors, status: :unprocessable_entity}
  #     end
  #   end
  # end

  # DELETE /pps/1
  # DELETE /pps/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to pps_url, notice: 'Pp was successfully destroyed.'}
      format.json { head :no_content}
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :role,
       :phoneno, :email, :password, :address)
      
    end

    def update_params
      params.require(:user).permit(:name, :phoneno, :address)
    end
end
