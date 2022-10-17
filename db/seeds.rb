
Admin::User.create(email: 'xhostcom@gmail.com', password: 'Password9957', password_confirmation: 'Password9957')

10.times do |id|
Workshop.create!(
    id: id,
    name: Faker::Educator.course_name,
    description: Faker::Lorem.paragraph,
    start_date: Date.today, 
    end_date: Date.today + 1.day, 
    start_time: '10:00', 
    end_time: '11:00', 
    total_sits: 10, 
    remaining_sits: 5,
    registration_fee: 1500
)
end

