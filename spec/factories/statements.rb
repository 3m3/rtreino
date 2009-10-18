Factory.define :invalid_statement, :class => Statement do |f|
end

Factory.define :statement do |f|
  f.association :creator, :factory => :user
  f.updater { |a| a.creator }
  f.association :language
  f.association :problem
  f.title "title"
  f.sequence(:body) { |n| "text#{n}" }
end
