class CommentsController < ApplicationController
  
  def new
    @document = Document.find(params[:document_id])
    @comment = Comment.new
  end

  def create
    @document = Document.find(params[:document_id])
    @comment = @document.comments.build(params[:comment])
    if @comment.save
      redirect_to @document, :notice => "Comment saved"
    else
      render 'new'
    end
  end
  
  def show
    @document = Document.find(params[:document_id])
    @comment = @document.comments.find(params[:id])
  end
  
end
