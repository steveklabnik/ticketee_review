FactoryGirl.define do
  factory :user do
    name "example_user"
    email "sample@example.com"
    password "hunter2"    
    password_confirmation "hunter2"    

    factory :admin_user do
      admin true
    end
  end
end
