FactoryGirl.define do
  sequence(:email) {|n| "user#{n}@example.com" }
  sequence(:name) {|n| "user#{n}" }

  factory :user do
    name { generate(:name) }
    email { generate(:email) }
    password "hunter2"
    password_confirmation "hunter2"

    factory :admin_user do
      admin true
    end
  end
end
