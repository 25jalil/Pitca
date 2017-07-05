FactoryGirl.define do
  factory :user do
    email 'example@email.com'
    password 'password'

    trait :admin do
      role 'admin'
    end
  end
end
