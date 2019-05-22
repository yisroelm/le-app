10.times do
  Client.create(
    first_name: Faker::Name.first_name ,
    last_name: Faker::Name.last_name,
    age: Faker::Number.between(19, 57),
    name:Faker::Name.name)
end

10.times do
  Appointment.create(
    date: Faker::Business.credit_card_expiry_date, #=> "Wed, 24 Sep 2014",
    time: Faker::Time.between(DateTime.now - 1, DateTime.now), #=> "2014-09-18 12:30:59 -0700",
    client_id: Client.all.sample.id,
    le_id: Le.all.sample.id)
end

10.times do
  Product.create(
    name: Faker::Dessert.variety,
    client_id: Client.all.sample.id)
end
