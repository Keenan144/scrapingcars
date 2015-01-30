require 'nokogiri'
require 'open-uri'


class Packager
  attr_reader :lux_urls, :packaged, :pre_sanitized

  def initialize
    @lux_urls =  ["http://www.kbb.com/ford/focus/2015-ford-focus/s/?vehicleid=402987"]
    @packaged = []
    @pre_sanitized = []

  end

  def scraper


    @lux_urls.map do |url|

      data = Nokogiri::HTML(open(url))
      @pre_sanitized << "#{url}"
      @pre_sanitized << data.at_css(".vehicle-ymm").text.strip

      (1..8).each do |num|
        css_selector = "tr:eq(#{num})"
        @pre_sanitized << data.at_css(css_selector).text.gsub!(/\D/, '')

        @packaged << @pre_sanitized.uniq!
      end
    end
  end


end

test = Packager.new
# test.lux_urls
test.scraper
p test.sanitizer
p test.pre_sanitized