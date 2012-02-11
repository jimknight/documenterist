class Document < ActiveRecord::Base
  
  mount_uploader :attachment, AttachmentUploader
  
end
