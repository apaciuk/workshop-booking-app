# == Schema Information
#
# Table name: workshops
#
#  id               :bigint           not null, primary key
#  description      :text
#  end_date         :datetime
#  end_time         :string
#  name             :string
#  registration_fee :integer
#  remaining_sits   :integer
#  start_date       :datetime
#  start_time       :string
#  total_sits       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Workshop < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true, if: :start_date, comparison: { greater_than: :start_date }
    validates :start_time, presence: true
    validates :end_time, presence: true, if: :start_time, comparison: { greater_than: :start_time }
    validates :total_sits, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :registration_fee, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :remaining_sits, numericality: { less_than_or_equal_to: :total_sits }
   
  
    def total_duration
        "#{(end_date - start_date).to_i}" + " days"
    end
end
    # has_many :workshop_registrations
   #  has_many :users, through: :workshop_registrations
