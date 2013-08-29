FactoryGirl.define do
  
  factory :anon_user, class: User do
    name 'John Doe'
    email 'john@example.com'
  end

end