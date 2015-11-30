# require 'factory_girl'
# load File.expand_path("spec/factories.rb")

include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :user do
    ignore do
      user_role nil
      type nil
    end

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password {email}
    confirmation_sent_at { Time.now }
    confirmed_at { Time.now }
    sign_in_count { 5 }
    role { user_role ? user_role : "Reader" }

    trait :new_user do
      confirmed_at nil
      confirmation_sent_at nil
      sign_in_count nil
      user_role "Reader"
    end

    factory :admin do
      role {"Super User"}
    end

  end

  factory :trade do

    quantity { 10 * (1+rand(10))}
    price { 10 + rand(100) }
    security_id  { Security.offset(rand(Security.count)).first.id }
    customer_id  { Customer.offset(rand(Customer.count)).first.id }
    buy_sell  { ["Buy", "Sell"][rand(2)] }
    trade_date  { Date.today }
    settlement_date  { Date.today + 1.day }
    user_id  { User.offset(rand(User.count)).first.id }
    team_id  { User.find(user_id).team_id }
    contest_id  { User.find(user_id).contest_id }

  end

  factory :customer do
    name { Faker::Company.name }
    credit_rating {Customer::RATINGS[rand(Customer::RATINGS.length)]}
    bank { "BONY" }
    account_number {1_000_000 + Random.rand(10_000_000 - 1_000_000)}
  end

  factory :contest do
    name { "Contest #{rand(5**5)}" }
    description { Faker::Company.catch_phrase }
    startDate {Date.today + rand(10)}
    currentTradeDate { startDate }
    is_active {true}
    auto_inc_days {true}
  end

  factory :team do
    name { "Team #{rand(5**5)}" }
    description { Faker::Company.catch_phrase }
    contest_id  { Contest.offset(rand(Contest.count)).first.id }
  end

  factory :security do

    name { Faker::Company.name }
    ticker { (0...3).map { ('a'..'z').to_a[rand(26)] }.join.upcase }
    description { Faker::Company.catch_phrase }
    sector {Security::SECTORS[rand(Security::SECTORS.length)]}
    region {Security::REGIONS[rand(Security::REGIONS.length)]}
    asset_class {Security::ASSET_CLASSES[rand(Security::ASSET_CLASSES.length)]}
    price {(rand(10) + 1)**2}
    tick_size {rand(10) + 1}
    liquidity {Security::LIQUIDITY[rand(Security::LIQUIDITY.length)]}
  end

end
