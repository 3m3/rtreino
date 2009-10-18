Factory.define :invalid_category, :class => Category do |f|
end

Factory.define :category_single, :class => Category do |f|
  f.sequence(:name) { |n| "Single#{n}" }
end

Factory.define :category do |f|
  f.sequence(:name) { |n| "Name#{n}" }
  f.association :category, :factory => :category_single
end
