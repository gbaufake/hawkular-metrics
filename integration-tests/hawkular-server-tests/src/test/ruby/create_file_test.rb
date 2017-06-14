 # Copyright 2014-2017 Red Hat, Inc. and/or its affiliates
 # and other contributors as indicated by the @author tags.
 #
 # Licensed under the Apache License, Version 2.0 (the "License");
 # you may not use this file except in compliance with the License.
 # You may obtain a copy of the License at
 #
 #    http://www.apache.org/licenses/LICENSE-2.0
 #
 # Unless required by applicable law or agreed to in writing, software
 # distributed under the License is distributed on an "AS IS" BASIS,
 # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 # See the License for the specific language governing permissions and
 # limitations under the License.

 
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