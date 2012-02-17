# == Schema Information
#
# Table name: documents
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  attachment  :string(255)
#

require 'carrierwave/test/matchers'
require 'spec_helper'

describe Document do
  include CarrierWave::Test::Matchers
  it "should have many comments" do
    @document = Document.new
    @document.should respond_to(:comments)
  end
  it "should have a comment as a child when it's created" do
    @document = Factory(:document)
    @document.comments.create(:body => "new comment")
    @document.comments.size.should == 1 
  end
end
