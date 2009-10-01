Factory.define :online_judge, :class => OnlineJudge do |f|
  f.sequence(:name) { |n| "JUDGE#{n}" }
  f.webpage "http://test"
end

Factory.define :invalid_online_judge, :class => OnlineJudge do |f|
end
