# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  notice_id   :integer
#  location    :string(200)
#  event_start :datetime
#  event_end   :datetime
#  title       :string(200)
#  body        :text(65535)
#  created_at  :datetime
#  updated_at  :datetime
#  scheduled   :boolean          default(TRUE)
#  all_day     :boolean          default(FALSE)
#  date        :string(255)
#  time        :string(255)
#
# Indexes
#
#  index_events_on_event_start  (event_start)
#  index_events_on_notice_id    (notice_id)
#  index_events_on_user_id      (user_id)
#

class EventSerializer < ActiveModel::Serializer
  attributes :id, :notice_id, :location, :event_start, :event_end
  attributes :title, :body, :created_at, :scheduled, :all_day
  attributes :date, :time
  attributes :court_case

  def court_case
    {
      case_number: object.court_case.case_number
    }
  end
end
