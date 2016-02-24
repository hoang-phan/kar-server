FactoryGirl.define do
  factory :patch do
    version { rand(10000) }
    link { Faker::Internet.url }
  end
end
