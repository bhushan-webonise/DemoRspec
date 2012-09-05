# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    comment "My first comment!!!"
    post nil
  end
end
