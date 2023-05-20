class Notification < ApplicationRecord
  before_create :notification_title
  
  belongs_to :user
  validates :recipient, presence: true
  validates :message, presence: true

  default_scope {order('notifications.created_at ASC')}

  def notification_title
    self.title = "Chat Message"
  end
end
