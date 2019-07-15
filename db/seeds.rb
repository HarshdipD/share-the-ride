User.create!(Fname:  "Harshdip Singh",
            Lname:  "Deogan",
             email: "harshdipsdeogan@gmail.com",
             password:              "foobaras",
             password_confirmation: "foobaras",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

10.times do |n|
  Fname  = Faker::Name.name
  Lname  = Faker::Name.name
  email = "example#{n+1}@shopify.com"
  password = "password"
  User.create!(Fname:  Fname,
               Lname: Lname,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end