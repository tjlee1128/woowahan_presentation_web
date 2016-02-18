class Api::CommentsController < ApplicationController

  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, only: [:create]

  respond_to :json

  def index
  	@comments = Presentation.find(params[:presentation_id]).comments
  end

  def create
    Comment.transaction do
      @comment = Presentation.find(params[:presentation_id]).comments.new(presentation_id: params[:presentation_id], user_id: params[:user_id], content: params[:content])
      @comment.save!
      @recent_comments = Presentation.find(params[:presentation_id]).comments.where("comment_id > ?", params[:comment_id])
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Presentation.find(params[:presentation_id]).comments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(
        :presentation_id, :user_id, :content
      )
    end
end
