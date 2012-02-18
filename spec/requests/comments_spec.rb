require 'spec_helper'

describe "Comments" do
  describe "POST /documents/1/comments/new" do
    it "create a child comment to a document" do
      @document = Factory(:document)
      visit new_document_comment_path(@document)
      fill_in 'comment_body', :with => 'a new comment'
      click_button 'Create Comment'
      @document.comments.size.should == 1
    end
  end
  describe "POST /comments/1/comments/new" do
    it "create a grand-child comment to a document" do
      @document = Factory(:document)
      @comment = @document.comments.create!(:body => "root comment")
      @document.comments.size.should == 1
      visit new_comment_comment_path(@comment)
      fill_in 'comment_body', :with => 'grandchild comment'
      click_button 'Create Comment'
      # do something here to prove it's good
    end
  end
end
