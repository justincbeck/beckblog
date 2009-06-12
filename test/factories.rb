Factory.define :user do |f|
  f.sequence(:login) { |n| "factory_user#{n}" }
  f.password  "factory_password"
  f.password_confirmation  { |u| u.password }
end