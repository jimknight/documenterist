# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  body       :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  ancestry   :string(255)
#

require 'spec_helper'

describe Comment do
  it "should have child comments" do
    @comment = Factory(:comment)
    @child_comment = Factory.build(:comment)
    @child_comment.parent_id = @comment.id
    @child_comment.depth.should == 1
  end
  it "should have granchild comments" do
    @comment = Factory(:comment)
    @child_comment = Factory.build(:comment)
    @child_comment.parent_id = @comment.id
    @child_comment.save
    @grandchild_comment = Factory.build(:comment)
    @grandchild_comment.parent_id = @child_comment.id
    @grandchild_comment.depth.should == 2
  end
end
