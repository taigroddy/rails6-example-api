

FactoryBot.define do
  factory :admin_user, class: User do
    email { 'chauductai1996@gmail.com' }
    password { '123123' }
    is_admin { true }
  end

  factory :user, class: User do
    sequence(:email) { |n| "chauductai1996+#{n}@gmail.com" }
    password { '123123' }
    is_admin { false }
  end
end