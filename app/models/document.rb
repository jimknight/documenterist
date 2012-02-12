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

class Document < ActiveRecord::Base
  
  # validates :title, :presence => true
  has_and_belongs_to_many :comments
  mount_uploader :attachment, AttachmentUploader
  
end
