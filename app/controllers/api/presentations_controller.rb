class Api::PresentationsController < ApplicationController

  before_action :set_presentation, only: [:show, :edit]
  before_action :set_prensentation_with_thumbs, only: [:thumbsup, :thumbsdown]
  skip_before_filter :verify_authenticity_token, only: [:thumbsup, :thumbsdown]

  respond_to :json

  # GET api/presentations.json
  def index
    @presentations = Presentation.find_by_category(params[:category_id])
                     .find_by_user(params[:user_id])
                     .order(created_at: :desc)
    respond_with(@presentations)
  end

  # GET api/presentations/1.json
  def show
    # 수정필요 @presentation.presentation_view.increment_counter :view_count, @presentation.presentation_id
    PresentationView.increment_counter :view_count, @presentation.presentation_id
    @favorite_presentation = @presentation.favorites.find_by(user_id: params[:user_id]).present?
    respond_with(@presentation)
  end

  # POST api/presentation/1/thumbsup.json?user_id=1
  def thumbsup
    @favorite = @presentation.favorites.new(user_id: params[:user_id])
    @favorite.save
  end

  # POST api/presentation/1/thumbsdown.json?user_id=1
  def thumbsdown
    @presentation.favorites.find_by(user_id: params[:user_id]).destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation
      @presentation = Presentation.find(params[:id])
    end

    def set_prensentation_with_thumbs
      @presentation = Presentation.find(params[:presentation_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presentation_params
      params.require(:presentation).permit(
        :user_id, :title, :subtitle, :content, :video, :pdf
      )
    end
end
