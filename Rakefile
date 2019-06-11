require "bundler/gem_tasks"
require_relative "./lib/environment"
task :default => :spec

def reload!
    load_all './lib'
end 

task :console do 
    Pry.start
end 