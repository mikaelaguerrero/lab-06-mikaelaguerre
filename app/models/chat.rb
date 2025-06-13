class Chat < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  has_many :messages, dependent: :destroy

  validates :sender_id, :receiver_id, presence: true
  validate :sender_and_receiver_must_be_different

  scope :involving, ->(user) do
    where("sender_id = ? OR receiver_id = ?", user.id, user.id)
  end

  private

  def sender_and_receiver_must_be_different
    if sender_id == receiver_id
      errors.add(:receiver, "must be different from sender")
    end
  end
end
