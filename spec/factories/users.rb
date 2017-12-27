FactoryBot.define do
  factory :user do
    name { FFaker::Name.first_name.gsub(/\W/, '') }
    email { FFaker::Internet.email }
    password "password"
  end
end
