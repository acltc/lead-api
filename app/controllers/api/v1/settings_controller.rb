class Api::V1::SettingsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @settings = Setting.all
    render json: @settings
  end

  def show
    @setting = Setting.first
    render json: @setting
  end

  def update_text_active
    @setting = Setting.find(params[:id])
    @setting.update(text_active: params[:settings][:text_active])
    redirect_to authenticated_root_path
  end

  def update_email_active
    @setting = Setting.find(params[:id])
    @setting.update(email_active: params[:settings][:email_active])
    redirect_to authenticated_root_path
  end
end
