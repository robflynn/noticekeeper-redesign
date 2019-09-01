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

class Document < ApplicationRecord
  belongs_to :notice
  has_one :court_case, through: :notice, foreign_key: 'client_id'

  def pdf_url
    "#{get_path_prefix}#{pdf_url_path}"
  end

  def thumbnail_url
    return "#{get_path_prefix}#{thumbnail_url_path}"
  end

  private

  def pdf_url_path
    "/#{court_case.user_id}/#{court_case.id}/#{filename}.pdf"
  end

  def thumbnail_url_path
    return  "/#{court_case.user_id}/#{court_case.id}/t_#{filename}.jpg"
  end

  def get_path_prefix
    if self.synced
      return "https://s3.amazonaws.com/documents.noticekeeper.com"
    end

    "/system/clientdata"
  end

end
