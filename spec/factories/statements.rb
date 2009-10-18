Factory.define :invalid_statement, :class => Statement do |f|
end

Factory.define :statement do |f|
  f.association :language
  f.association :problem
  f.title "title"
  f.body "text"
end
