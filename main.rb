require_relative './app'
require './data'
require 'json'

puts 'Welcome to your school library!!!'
initialize_files
def main
  app = App.new
  app.start
end

main
