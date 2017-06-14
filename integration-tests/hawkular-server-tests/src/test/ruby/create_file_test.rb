require 'dotenv'
require 'json'
require 'active_support'
require 'active_support/core_ext'

describe "Create File for Hawkular Metrics " do

  # Starting Request
  before(:each) do
      @start_date = Time.parse(ENV['START_DATE'])
      @finish_date = Time.parse(ENV['END_DATE'])
    end

  it "should be the first date and last date " do
    array = []
    base_date = @start_date
    loop do
      hash = {}
      hash[:timestamp ] = base_date.to_i
      hash[:value] = SecureRandom.random_number(100)
      array << hash
      base_date = base_date+ 1.second
      break if base_date == @finish_date
    end

    File.open(@start_date.strftime('%v') + @finish_date.strftime('%v') + ".json" ,"w") do |f|
        f.write(JSON.pretty_generate(array))
    end
    end
end