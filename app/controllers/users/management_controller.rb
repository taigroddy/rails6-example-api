class Users::ManagementController < ApplicationController
  before_action :only_admin, only: [:index]

  def list
    users = User.where(is_admin: [false, nil]).page params[:page]
    render json: users
  end

  def update_user
    begin
      user = check_user
      user.update!(user_params)
      render json: { success: true, data: user}
    rescue Exception => e
      render json: { error: e.message }
    end
  end

  def delete_user
    begin
      user = check_user
      user.destroy!
      render json: { success: true, data: user }
    rescue => e
      render json: { error: e.message }
    end
  end

  private 

  def check_user 
    if user_params.nil?
      raise Exception.new "Params is wrong."
    end

    user = User.find(user_params[:id])

    if user.is_admin?
      raise Exception.new "You can not edit/delete this user!"
    end

    user
  end

  def user_params
    list_permit = [:id, :name, :phone, :address]
    list_permit << :password if @current_user_id == params[:id].to_i

    params[:user][:id] = params[:id] if params[:id].present?
    params.require(:user).permit(list_permit);
  end
end
