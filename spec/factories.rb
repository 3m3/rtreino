Factory.define :problem do |f|
  f.sequence(:code) { |n| "code#{n}" }
  f.name "Name"
  f.source "Source"
  f.association :level
end

Factory.define :level do |f|
  f.name "Name"
end

Factory.define :invalid_category, :class => Category do |f|
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


Factory.define :invalid_level, :class => Level do
end

Factory.define :level do |f|
  f.sequence(:name) { |n| "level#{n}" }
end

Factory.define :invalid_language do |f|
end

Factory.define :language do |f|
  f.sequence(:abbreviation) do |n|
    r = ""
    n += 26
    while n > 0
      r += (?a + (n % 26)).chr
      n /= 26
    end
    r
  end
  f.name { |l| l.abbreviation }
end
