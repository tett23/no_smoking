require 'bundler'
Bundler.require

require 'active_support/core_ext'
require 'csv'
require 'date'

set :views, File.dirname(__FILE__)+'/views'

get '/' do
  @stat = {}

  CSV.open('./csv/stat.csv').to_a.each do |item|
    date = DateTime.parse(item.first).strftime('%Y/%m/%d')
    count = item.last.to_i

    @stat[date] = 0 if @stat[date].blank?
    @stat[date] += count
  end

  haml :index
end

get '/smoking' do
  CSV.open('./csv/stat.csv', 'a') do |csv|
    csv << [Time.now, 1]
  end

  redirect '/'
end
