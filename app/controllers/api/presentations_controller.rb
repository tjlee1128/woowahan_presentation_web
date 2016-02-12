class Api::PresentationsController < ApplicationController
  before_action :set_presentation, only: [:show, :edit, :update, :destroy]

  respond_to :json

  # GET api/presentations.json
  def index
    @presentations = Presentation.all
    respond_with(@presentations)
  end

  # GET api/presentations/1.json
  def show
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
