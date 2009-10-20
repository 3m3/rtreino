Factory.define :invalid_comment, :class => Comment do |f|
end

Factory.define :comment_from_analysis, :class => Comment do |f|
  f.body 'text'
  f.association :commentable, :factory => :analysis
  f.association :creator, :factory => :user
  f.updater { |a| a.creator }
end

Factory.define :comment_from_comment, :class => Comment do |f|
  f.body 'text 2'
  f.association :commentable, :factory => :comment_from_analysis
  f.association :creator, :factory => :user
  f.updater { |a| a.creator }
end
