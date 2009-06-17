# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'metric_fu'
require 'tasks/rails'

desc 'Default: run unit tests.'
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/functional/controllers/*test.rb',
                          'test/integration/*test.rb',
                          'test/performance/*test.rb',
                          'test/unit/models/*test.rb' ]
  t.verbose = true
end

