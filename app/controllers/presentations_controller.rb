class PresentationsController < ApplicationController
  include VideoHelper
  include PdfHelper

  before_action :set_presentation, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  # GET /presentations
  # GET /presentations.json
  def index
    @presentations = Presentation.all
    respond_with(@presentations)
  end

  # GET /presentations/1
  # GET /presentations/1.json
  def show
    respond_with(@presentation)
  end

  # GET /presentations/new
  def new
    @presentation = Presentation.new
    respond_with(@presentation)
  end

  # GET /presentations/1/edit
  def edit
  end

  # POST /presentations
  # POST /presentations.json
  def create
    @presentation = Presentation.new(presentation_params)
    @presentation.save
    VideoHelper.create_single_video(params[:video], @presentation.id)
    PdfHelper.create_single_pdf(params[:pdf], @presentation.id)
    PdfHelper.convert(@presentation.pdf, @presentation)
    respond_with(@presentation)
  end

  # PATCH/PUT /presentations/1
  # PATCH/PUT /presentations/1.json
  def update
    @presentation.update(presentation_params)
    VideoHelper.update_single_video(params[:video], @presentation.id)
    if params[:pdf]
      PdfHelper.update_single_pdf(params[:pdf], @presentation.id)
      PdfHelper.convert(@presentation.pdf, @presentation)
    end
    respond_with(@presentation)
  end

  # DELETE /presentations/1
  # DELETE /presentations/1.json
  def destroy
    @presentation.destroy
    VideoHelper.delete_single_video(@presentation.id)
    PdfHelper.delete_single_pdf(@presentation.id)
    respond_with(@presentation)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation
      @presentation = Presentation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presentation_params
      params.require(:presentation).permit(
        :user_id, :title, :subtitle, :content, :video, :pdf
      )
    end
end