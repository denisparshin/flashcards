FactoryGirl.define do
  factory :user do |item|
    item.email 'test@gmail.com'
    item.password '111'
    item.id 15
  end
end
