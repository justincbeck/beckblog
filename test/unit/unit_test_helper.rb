require File.dirname(__FILE__) + "/../test_helper"
require "unit_record"
require "mocha"
# TODO: To use the .disconnect! method, I need to be stubbing
#ActiveRecord::Base.disconnect!
ActiveRecord::Base
