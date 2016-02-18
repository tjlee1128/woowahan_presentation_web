class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
    respond_with(@comments)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    respond_with(@comment)
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    respond_with(@comment)
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    Comment.transaction do
      @comment = Comment.new(comment_params)
      @comment.save
    end
    respond_with(@comment)
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @comment.update(comment_params)
    respond_with(@comment)
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_with(@comment)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:presentation_id, :user_id, :content)
    end
end
