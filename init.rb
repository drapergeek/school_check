#!/usr/bin/ruby
require 'rubygems'
require 'hpricot'
require 'open-uri'

require File.join(File.expand_path(File.dirname(__FILE__)), "config.rb")

doc = Hpricot(open(WEBSITE_URL))

for school in SCHOOLS
  #First we need to open the page
  status = "Regular Schedule"
  (doc/"body//table//td").each do |item|
     if item.inner_html.strip == school
        status = item .next.inner_html
    end
  end
  #clean up the school name:
  name = school.split(" ")[0]
  puts name + ": " + status
end
