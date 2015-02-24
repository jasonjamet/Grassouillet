class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end


  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/pdf
  def pdf
    @users = User.all
    pdf_string = "<head><body><div id='TitreProjet'>Details des utilisateurs</div><table>
    <thead>
    <tr>
    <th>Nom</th>
    <th>E-Mail</th>
    <th>Age</th>
    <th>Poids actuel</th>
    <th>Poids ideal</th>
    <th>Taille</th>
    <th>IMC</th>
    <th>Actuellement en regime</th>
    <th>Voeux de regime</th>
    </tr>
    </thead>
    <tbody>"
    @users.each do |user|
      pdf_string=pdf_string+"

      <tr>
      <td>"+user.name+"</td>
      <td>"+user.mail+"</td>
      <td>"+((Time.zone.today-(user.date_of_birth)).to_i/365.242199).to_i.to_s+" ans</td>
      <td>"+user.actual_weight.to_s+" kg</td>
      <td>"+user.ideal_weight.to_s+" kg</td>
      <td>"+(user.size/100).to_i.to_s+"m"+(user.size%100).to_i.to_s+"</td>
      <td>"+user.getIMC.to_s+"</td>
      <td>"+user.bool2String(user.in_diet.to_s)+"</td>
      <td>"+user.bool2String(user.like_diet.to_s)+"</td>
      </tr>"
    end
    pdf_string=pdf_string+"</tbody></table><body><head>"

    # Save the html to a PDF file
    kit = PDFKit.new(pdf_string)
    kit.stylesheets << "#{Rails.root}/public/stylesheets/stylesheet.css"
    kit.to_file("#{Rails.root}/public/UserList.pdf")
    redirect_to "/UserList.pdf"
  end


  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    user_params_tmp = user_params
    if user_params["name"].present? && user_params["mail"].present? && user_params["date_of_birth"].present? && user_params["actual_weight"].present? && user_params["ideal_weight"].present? && user_params["size"].present? && (user_params["like_diet"]==false || user_params["like_diet"]==true)  && (user_params["like_diet"]==false || user_params["like_diet"]==true)
      user_params_tmp["name"]=user_params_tmp["name"].upcase
    end
    @user = User.new(user_params_tmp)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: 'new'
    end


  end

  # PATCH/PUT /users/1
  def update
    user_params_tmp = user_params
    if user_params["name"].present? && user_params["mail"].present? && user_params["date_of_birth"].present? && user_params["actual_weight"].present? && user_params["ideal_weight"].present? && user_params["size"].present? && (user_params["like_diet"]==false || user_params["like_diet"]==true)  && (user_params["like_diet"]==false || user_params["like_diet"]==true)
      user_params_tmp["name"]=user_params_tmp["name"].upcase
    end
    if @user.update(user_params_tmp)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end

  end

  # DELETE /users/1
  def destroy
    @user.remove_cv!
    @user.delete
    redirect_to :action => 'index'

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    if(!User.exists?(params[:id]))
      redirect_to "/404.html"
    else
      @user = User.find(params[:id])
    end



  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :mail, :date_of_birth, :actual_weight, :ideal_weight, :size, :in_diet, :like_diet, :cv, :remove_cv)
  end
end
