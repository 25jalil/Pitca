FactoryGirl.define do
  factory :user do
    name 'ilnar'
    email 'example@email.com'
    password 'password'

    trait :admin do
      role 'admin'
    end

    factory :user_with_store do
    	after(:create) do |user|
        create(:store, user: user)
      end
    end  
  end

  factory :store do
  	company { Faker::Company.name }
    address 'kazan, pushkina 46'
    latitude '55.793719'
    latitude '55.793719'
  end
end


