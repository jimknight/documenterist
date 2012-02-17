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
end
