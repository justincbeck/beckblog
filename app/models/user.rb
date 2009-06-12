class User < ActiveRecord::Base
  acts_as_authentic

  validates_length_of :login, :within => 6..20, :too_long => "pick a shorter name", :too_short => "pick a longer name"

  has_many :posts
end
