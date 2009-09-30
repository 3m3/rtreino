Factory.define :problem do |f|
  f.sequence(:code) { |n| "code#{n}" }
  f.name "Name"
  f.source "Source"
  f.problem_type 'Math'
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


Factory.define :invalid_user, :class => User do
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

Factory.define :invalid_language, :class => Language do |f|
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


Factory.define :invalid_statement, :class => Statement do |f|
end

Factory.define :statement do |f|
  f.association :language
  f.association :problem
  f.body "text"
end

Factory.define :invalid_analysis, :class => Analysis do |f|
end
Factory.define :analysis do |f|
  f.association :user
  f.association :problem
  f.body "text"
end


Factory.define :invalid_comment, :class => Comment do |f|

end
Factory.define :comment_from_analysis, :class => Comment do |f|
  f.body 'text'
  f.association :commentable, :factory => :analysis
  f.association :user
end

Factory.define :comment_from_comment, :class => Comment do |f|
  f.body 'text 2'
  f.association :commentable, :factory => :comment_from_analysis
  f.association :user
end
