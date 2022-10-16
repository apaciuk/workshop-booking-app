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
  it 'is not valid without a name' do 
    workshop.name = nil
    expect(workshop).to_not be_valid
 end 
  it 'is not valid without a description' do
    workshop.description = nil
    expect(workshop).to_not be_valid
 end 
  it 'is not valid without a start date' do
    workshop.start_date = nil
    expect(workshop).to_not be_valid
 end 
  it 'is not valid without a end date' do
    workshop.end_date = nil
    expect(workshop).to_not be_valid
 end 
  it 'is not valid without a start time' do
    workshop.start_time = nil
    expect(workshop).to_not be_valid
 end 
  it 'is not valid without a end time' do
    workshop.end_time = nil
    expect(workshop).to_not be_valid
 end 
  it 'is not valid without a total sits' do
    workshop.total_sits = 0.0
    expect(workshop).to_not be_valid
 end 
  it 'is not valid without a registration fee' do
    workshop.registration_fee = nil
    expect(workshop).to_not be_valid
 end

end
