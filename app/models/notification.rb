class Notification < ApplicationRecord
  before_create :notification_title
  
  belongs_to :user
  validates :message, presence: true

  def notification_title
    self.title = "Chat Message"
  end
end
