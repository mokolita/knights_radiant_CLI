require "knights_radiant/version"
require "bundler"
Bundler.require 
module KnightsRadiant
  class Error < StandardError; end
  # Your code goes here...
end

require_all "./lib"
require_relative "./scraper"
require_relative "./surge"
require 'nokogiri'
require 'colorize'
require 'colorized_string'