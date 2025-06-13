class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :body, presence: true

  
  scope :recent_first, -> { order(created_at: :desc) }
end
