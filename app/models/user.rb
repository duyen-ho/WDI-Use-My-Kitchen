class User < ApplicationRecord
  has_secure_password
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :received_messages, class_name: "Message", foreign_key: "recipient_id"

  validates :name, presence: true
  validates :name, length: { minimum: 2 }

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :password, length: { in: 6..20 }

  # TODO *** reminder to re-ative before deploy ***
  # validate :password_complexity
  # def password_complexity
  #    if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d). /)
  #      errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
  #    end
  # end

  validates :description, presence: true
  validates :description, length: { minimum: 10 }

  validates :photo_url, presence: true
  validates :photo_url, length: { minimum: 2 }

end
