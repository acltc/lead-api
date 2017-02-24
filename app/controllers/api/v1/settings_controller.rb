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

  def update
    @setting = Setting.find(params[:id])
    @setting.update(active: params[:settings][:active])
    redirect_to authenticated_root_path
  end
end
