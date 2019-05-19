class ProjectsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ProjectsChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
