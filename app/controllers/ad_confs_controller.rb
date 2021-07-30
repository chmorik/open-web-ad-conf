class AdConfsController < ApplicationController
  before_action :set_ad_conf, only: [:show, :update, :destroy]

  # GET /ad_confs
  def index
    @ad_confs = AdConf.all

    render json: @ad_confs
  end

  # GET /ad_confs/1
  def show
    render json: @ad_conf
  end

  # POST /ad_confs
  def create
    @ad_conf = AdConf.new(ad_conf_params)

    if @ad_conf.save
      render json: @ad_conf, status: :created, location: @ad_conf
    else
      render json: @ad_conf.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ad_confs/1
  def update
    if @ad_conf.update(ad_conf_params)
      render json: @ad_conf
    else
      render json: @ad_conf.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ad_confs/1
  def destroy
    @ad_conf.destroy
  end

  def best
    return render json: {error_message: 'invalid params'} if params[:partner_id].blank? && params[:component].blank?
    
    ad_conf = Rails.cache.fetch("#{params[:partner_id]},#{component: params[:component]},#{params[:platform]},#{params[:country_code]}", expires_in: 12.hours) do
      ad_confs = AdConf.where(partner_id: params[:partner_id], component: params[:component])
      reutrn nil if ad_confs.blank?
      
      ad_confs_by_platform = ad_confs.where(platform: params[:platform])
      return ad_confs.first if ad_confs_by_platform.blank?

      ad_confs_by_country = ad_confs_by_platform.where(country_code: params[:country_code])
      return ad_confs_by_platform.first if ad_confs_by_country.blank?

      ad_confs_by_country.first
    end
    render json: ad_conf
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad_conf
      @ad_conf = AdConf.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ad_conf_params
      params.require(:ad_conf).permit(:ad_code, :component, :platform, :country_code, :partner_id)
    end
end
