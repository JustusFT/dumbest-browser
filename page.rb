require 'net/http'
require 'nokogiri'
require 'open-uri'

class Page
  attr_reader :url
  def initialize(url)
    @url = url
  end

  def fetch!
    @doc = Nokogiri::HTML(open(@url))
  end

  def title
    @doc.css("title").text
  end

  def links
    result = []
    @doc.css("a").each do |x|
      next unless x[:href].include? "://"
      result << x[:href]
    end
    result
    # Research alert!
    # How do you use Nokogiri to extract all the link URLs on a page?
    #
    # These should only be URLs that look like
    #   <a href="http://somesite.com/page.html">Click here!</a>
    # This would pull out "http://somesite.com/page.html"
  end
end
