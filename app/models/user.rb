# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                         :bigint           not null, primary key
#  admin                      :boolean          default(FALSE)
#  announcements_last_read_at :datetime
#  current_sign_in_at         :datetime
#  current_sign_in_ip         :string
#  email                      :string           default(""), not null
#  encrypted_password         :string           default(""), not null
#  first_name                 :string
#  last_name                  :string
#  last_sign_in_at            :datetime
#  last_sign_in_ip            :string
#  remember_created_at        :datetime
#  reset_password_sent_at     :datetime
#  reset_password_token       :string
#  sign_in_count              :integer          default(0), not null
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
  :rememberable, :validatable, :omniauthable, :trackable

  has_one_attached :avatar
  has_person_name
  has_noticed_notifications

  has_many :notifications, as: :recipient, dependent: :destroy
  has_many :services

  validates :first_name, presence: true
  validates :last_name, presence: true  
  validates :email, presence: true, uniqueness: true

  PASSWORD_REQUIREMENTS = /\A (?=.{8,}) (?=.*\d) (?=.*[a-z]) (?=.*[A-Z]) (?=.*[[:^alnum:]]) /x

  validates :password, format: { with: PASSWORD_REQUIREMENTS, message: 'Please set a strong password' }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.avatar.attach(io: open(auth.info.image), filename: 'avatar.jpg', content_type: 'image/jpg')
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    admin
  end

  def avatar_url
    if avatar.attached?
      avatar.variant(resize: '100x100!').processed
    else
      'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y'
    end
  end
end

