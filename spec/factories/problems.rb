Factory.define :problem do |f|
  f.sequence(:code) { |n| "code#{n}" }
  f.name "Name"
  f.source "Source"
  f.problem_type 'Math'
  f.association :level
  f.sequence(:online_judge_link) { |n| "http://test.com/#{n}" }
end

