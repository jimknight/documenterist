class CreateCommentsDocuments < ActiveRecord::Migration
  def up
    create_table "comments_documents", :id => false do |t|
      t.column "comment_id", :integer, :null => false
      t.column "document_id",  :integer, :null => false
    end
  end

  def down
    drop_table "comments_documents"
  end
end
