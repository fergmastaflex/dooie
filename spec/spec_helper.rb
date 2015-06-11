# Notice there is a .rspec file in the root folder. It defines rspec arguments
require 'rubygems'
require 'bundler/setup'

Bundler.require(:default, :development, :test)

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.after(:suite) do
    FileUtils.rm_rf(Dir["**/todo_items.txt"])
  end
end
