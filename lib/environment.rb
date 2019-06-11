require "knights_radiant/version"
require "bundler"
Bundler.require 
module KnightsRadiant
  class Error < StandardError; end
  # Your code goes here...
end

#require_relative '../rakefile'
require_all "./lib"