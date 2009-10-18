Factory.define :invalid_analysis, :class => Analysis do |f|
end

Factory.define :analysis do |f|
  f.association :user
  f.association :problem
  f.body "text"
end
