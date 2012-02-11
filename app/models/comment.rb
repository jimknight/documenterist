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

class Comment < ActiveRecord::Base
  
  has_ancestry
  belongs_to :document  
  
end
