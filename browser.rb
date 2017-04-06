require 'net/http'
require 'nokogiri'
require 'open-uri'


# require_relative 'util'

class Browser
  def run!
    print "url> "
    url = gets.chomp
    puts "Fetching..."
    doc = Nokogiri::HTML(open(url))
    puts "Title: #{doc.css("title").text}"
    puts "Content length: "
    doc.css("a").each do |x|
      puts "  #{x[:href]}"
    end
    # Run the browser
    # Display a prompt for a user
    # Parse their input
    # Display useful results by instantiating
    #   a new Page and calling methods on it.

    # Questions:
    #  1. How can a user quit the browser gracefully?
    #  2. How can a user ask for help, i.e., how do they know what commands are available to them?
  end
end

Browser.new.run!
