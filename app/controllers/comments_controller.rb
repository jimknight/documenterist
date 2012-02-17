class CommentsController < ApplicationController
  
  def new
    @document = Document.find(params[:document_id])
    @comment = Comment.new
  end

  def create
    @document = Document.find(params[:document_id])
    @comment = Comment.new(params[:comment])
    if @comment.save
      @document.comments << @comment # not sure why build never works for me in controller
      redirect_to documents_path, :notice => "Comment saved"
    else
      render 'new'
    end
  end
  
  def show
    @document = Document.find(params[:document_id])
    @comment = Comment.find(params[:id])
  end
  
end
