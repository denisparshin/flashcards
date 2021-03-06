# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rubygems'
require 'nokogiri' 

require 'open-uri'
   
page = Nokogiri::HTML(open("http://1000mostcommonwords.com/1000-most-common-german-words/"))  

page.search('//*[@id="post-188"]/div/table/tbody/tr').each do |row|
  original_text = row.search('td[2]')[0].text
  translated_text = row.search('td[3]')[0].text
  Card.create(original_text: original_text, translated_text: translated_text)
end
  
