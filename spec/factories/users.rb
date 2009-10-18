Factory.define :invalid_user, :class => User do
end

Factory.define :user do |f|
  f.sequence(:username) { |n| "username#{n}" }
  f.password "password" 
  f.password_confirmation { |p| p.password }
  f.sequence(:email) { |n| "username#{n}@test.com" }
end
