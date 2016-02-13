class CommonCodesController < ApplicationController
  before_action :set_common_code, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  # GET /common_codes
  # GET /common_codes.json
  def index
    @common_codes = CommonCode.all
    respond_with(@presentations)
  end

  # GET /common_codes/1
  # GET /common_codes/1.json
  def show
    respond_with(@presentation)
  end

  # GET /common_codes/new
  def new
    @common_code = CommonCode.new
    respond_with(@presentation)
  end

  # GET /common_codes/1/edit
  def edit
  end

  # POST /common_codes
  # POST /common_codes.json
  def create
    @common_code = CommonCode.new(common_code_params)
    @common_code.save
    respond_with(@presentation)
  end

  # PATCH/PUT /common_codes/1
  # PATCH/PUT /common_codes/1.json
  def update
    @common_code.update(common_code_params)
    respond_with(@presentation)
  end

  # DELETE /common_codes/1
  # DELETE /common_codes/1.json
  def destroy
    @common_code.destroy
    respond_with(@presentation)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_common_code
      @common_code = CommonCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def common_code_params
      params.require(:common_code).permit(
        :common_code_type, :common_code_detail_id, :name_korean, :yn_use
      )
    end
end
