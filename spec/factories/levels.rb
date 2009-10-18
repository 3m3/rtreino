Factory.define :invalid_level, :class => Level do
end

Factory.define :level do |f|
  f.sequence(:name) { |n| "level#{n}" }
end
