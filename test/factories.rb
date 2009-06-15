Factory.define :user do |f|
  f.sequence(:login) { |n| "factory_user#{n}" }
  f.password  "factory_password"
  f.password_confirmation  { |u| u.password }
end

Factory.define :post do |f|
  f.subject "This is the subject of a test post."
  f.body "This is the body of a test post."
  f.published true
  f.association :user
end

Factory.define :comment do |f|
  f.sequence(:username) { |n| "username-#{n}" }
  f.email "nobody@justinbeck.com"
  f.body "This is the body of a comment."
  f.association :post
end

Factory.define :image do |f|
  f.name "image_name"
  f.file "Photo 37.jpg"
end