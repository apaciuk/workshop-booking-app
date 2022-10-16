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
require 'rails_helper'

RSpec.describe Workshop, type: :model do
 let(:workshop) { build(:workshop) }
    it 'is valid with valid attributes' do 
    expect(workshop).to be_valid
 end
end
