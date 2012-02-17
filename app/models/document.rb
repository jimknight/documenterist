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
  
  has_and_belongs_to_many :comments
  default_scope :order => 'updated_at DESC'
  mount_uploader :attachment, AttachmentUploader
  
  def file_name
    if attachment.to_s
      File.basename(attachment.to_s)
    else
      "<no file found>"
    end
  end
  
end
