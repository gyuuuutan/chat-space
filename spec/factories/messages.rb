FactoryGirl.define do

  factory :message do
    body Faker::Lorem.sentence
    user_id Faker::Number.between(1, 100)
    chat_group_id Faker::Number.between(1, 100)
  end

end
