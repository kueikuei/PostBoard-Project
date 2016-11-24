class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  #Two Admins:
  # God
  # 8123306777
  # Gesus
  # E8D1e2d3EE

  # GET /admins
  def index
    @admins = Admin.all
  end

  # GET /admins/1
  def show
  end

  # GET /admins/new
  # -------上帝是神，不能創造----------
  # def new
  #   @admin = Admin.new
  # end

  # def create
  #   @admin = Admin.new(admin_params)
  #     if @admin.save
  #       respond_to do |format|
  #     		format.html { redirect_to admins_path, notice: 'Admin was successfully created.' }
  #     	end
  #     else
  #       render :new
  #     end
  # end
  # -------上帝是神，不能創造----------

  def login
  end

  def login_create
  	# binding.pry
    @admin = Admin.find_by(name: params[:name])   

    if @admin &&  @admin.authenticate(params[:password])
      # 驗證成功建立一個session hash
      # 要操作Session，直接操作session這個Hash變數即可
      session[:admin_id] = @admin.id
      # 登入後進入首頁root_path
      # redirect_to admins_path
      respond_to do |format|
      	format.html { redirect_to admins_path, notice: 'Admin successfully logined.' }
      	# format.html { redirect_to admins_path}
      	# # format.js
      	# flash[:alert] = "Post successfully created"

      end

    else
    	render :login
    end
  end

  def logout_destroy
  	session[:admin_id] = nil
  	render :login
  end
  
  def edit
  end

  def update
    #先找到舊的資料
    @admin = Admin.find(params[:id])

    if @admin.update(admin_params)
      respond_to do |format|
      	format.html { redirect_to admins_path, notice: 'Admin was successfully updated.' }
      end
    else
      respond_to do |format|
      	format.html { render :edit, notice: 'Please update again.' }
      end
      # render :edit
    end
  end

  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_path, notice: 'Admin was successfully destroyed.' }
      #format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      # binding.pry
      params.require(:admin).permit(:name, :password)
    end

end