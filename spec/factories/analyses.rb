Factory.define :invalid_analysis, :class => Analysis do |f|
end

Factory.define :analysis do |f|
  f.association :creator, :factory => :user
  f.updater { |a| a.creator }
  f.association :problem
  f.body "text"
end
