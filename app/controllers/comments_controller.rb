class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(:body => params[:comment][:body])
    if params[:comment][:document_id] == ""
      @comment.parent_id = params[:comment][:comment_id]
    else
      @document = Document.find(params[:comment][:document_id])
      @document.comments << @comment
    end
    if @comment.save
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
