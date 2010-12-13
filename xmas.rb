#!/usr/bin/env ruby
require 'sinatra'
require 'haml'
require 'sass'
require 'Date'

get '/' do
  # Figure out how many days until christmas
  today = Date.today
  xmas  = Date.civil( today.strftime('%Y').to_i, 12, 25 )
  days_til = xmas - today
  
  if days_til < 0
    xmas  = Date.civil( (today.strftime('%Y').to_i + 1), 12, 25)
    days_til = xmas - today
  end
  
  @answer  = 'No'
  @message = "There are #{days_til} day(s) until Christmas."
  if days_til == 0
    @answer  = 'Yes!'
    @message = "Merry Christmas!" 
  end
  
  haml :index
end

# SASS stylesheets
get '/stylesheets/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :application
end

get '/stylesheets/iphone.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :iphone
end

get '/iphone.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :iphone
end