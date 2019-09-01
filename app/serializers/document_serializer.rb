# == Schema Information
#
# Table name: documents
#
#  id         :integer          not null, primary key
#  notice_id  :integer
#  name       :string(128)
#  filename   :string(128)
#  pages      :integer          default(0)
#  synced     :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#  converted  :boolean          default(FALSE)
#  md5_hash   :string(255)      default("")
#
# Indexes
#
#  index_documents_on_md5_hash   (md5_hash)
#  index_documents_on_notice_id  (notice_id)
#

class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :name, :filename, :pages, :pdf_url, :thumbnail_url
end
