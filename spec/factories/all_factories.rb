require "refile/file_double"

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
  	company { 'Flatsatck' }
    address 'kazan, pushkina 46'
    latitude '55.793719'
    longitude '49.1253406'
    cost_of_shipping 35.0
  
    factory :store_with_product do
      after(:create) do |store|
        create(:product, store: store)
      end
    end
  end

  factory :product do 
    name { Faker::Food.dish }
    description { Faker::Food.description }
    price { Faker::Number.decimal(2) }
    product_image = Refile::FileDouble.new("dummy", "logo.png", content_type: "image/png")
    category 'first course'
  end
end


