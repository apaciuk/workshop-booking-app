

Admin::User.create(email: 'admin@example.com', password: 'Password9957', password_confirmation: 'Password9957')

Workshop.create!(
    name: 'Workshop 1', 
    description: 'This is a workshop', 
    start_date: '2021-01-01', 
    end_date: '2021-01-02', 
    start_time: '10:00', 
    end_time: '11:00', 
    total_sits: 10, 
    remaining_sits: 5,
    registration_fee: 0
)

