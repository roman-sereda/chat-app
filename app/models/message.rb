class Message < ApplicationRecord

  belongs_to :chat
  belongs_to :user

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end

end
