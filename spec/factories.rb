Factory.define :problem do |f|
  f.sequence(:code) { |n| "code#{n}" }
  f.name "Name"
  f.source "Source"
  f.association :level
end

Factory.define :level do |f|
  f.name "Name"
end

Factory.define :category_single, :class => Category do |f|
  f.sequence(:name) { |n| "Single#{n}" }
end

Factory.define :category do |f|
  f.sequence(:name) { |n| "Name#{n}" }
  f.association :category, :factory => :category_single
end

Factory.define :user do |f|
  f.sequence(:username) { |n| "username#{n}" }
  f.password "password" 
  f.password_confirmation { |p| p.password }
  f.sequence(:email) { |n| "username#{n}@test.com" }
end
