# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    name "post1"
    title "Post"
    content "Hello World!!!"
  end
end
