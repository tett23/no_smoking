require 'bundler'
Bundler.require

require 'csv'

class SmokingPlot < Thor
  desc 'plot', '記録'
  def plot
    CSV.open('./csv/stat.csv', 'a') do |csv|
      csv << [Time.now, 1]
    end
  end
  default_task :plot
end

SmokingPlot.start
