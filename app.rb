Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

require("bundler/setup")
Bundler.require(:default)
