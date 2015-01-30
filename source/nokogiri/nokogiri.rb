require 'nokogiri'
require 'open-uri'


class Packager
  attr_reader :lux_urls, :packaged, :pre_sanitized

  def initialize
    @lux_urls =  ["http://www.kbb.com/tesla/model-s/2014-tesla-model-s/performance/?vehicleid=396060&intent=buy-new", "http://www.kbb.com/mercedes-benz/sls-class/2015-mercedes-benz-sls-class/sls-amg-gt-final-edition/?vehicleid=401749&intent=buy-new&category=luxury&options=", "http://www.kbb.com/bentley/flying-spur/2014-bentley-flying-spur/w12/?vehicleid=396043&intent=buy-new&category=luxury&options=", "http://www.kbb.com/rolls-royce/phantom/2014-rolls-royce-phantom/coupe/?vehicleid=399487&intent=buy-new&category=luxury","http://www.kbb.com/aston-martin/vantage/2015-aston-martin-vantage/v8-gt/?vehicleid=396495&intent=buy-new&category=luxury"]
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

      end
      @packaged << @pre_sanitized
      @pre_sanitized = []
    end

  end


end

test = Packager.new
# test.lux_urls
test.scraper
# p test.sanitizer
p test.packaged