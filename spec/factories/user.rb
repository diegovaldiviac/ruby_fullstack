FactoryBot.define do
    factory :user do
      sequence(:first_name) { |n| "John#{n}" }
      sequence(:last_name) { |n| "Doe#{n}" }
      sequence(:email) { |n| "john.doe#{n}@example.com" }
      password_digest { "password#{rand(1000)}" }
      role { "admin" }
    end
  end