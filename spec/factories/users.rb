FactoryBot.define do

  factory :user do
    name { Faker::Name.name }
    last_name { Faker::Name.name }
    email { Faker::Internet.email }
    password  { '123456' }
  end
end