require 'csv'
require 'benchmark'
require_relative 'sort.rb'

lengths = [1, 2, 5, 10, 20, 30, 50, 75, 100, 150, 250, 500, 750, 1000, 2500, 5000, 7500, 10000]
methods = ["bubblesort", "gnomesort", "selectionsort", "insertionsort", "shellsort", "radixsortlsd", "quicksort"]
seperator = ","

header = "Random#{seperator}" + methods.collect{|m|m.capitalize}.join(seperator) + "\n"
File.open("../csv/random.csv", "w+") do |line|
	t = Time.now
	line << header 
	lengths.each do |length|
		output = [length]
		array = []
		(length).times {array << rand(length*10)}

		methods.each do |method|
			time = Benchmark.realtime {10.times{send(method, array)}}
			output << ((time/10)*1000).round(8)
		end
		output[-1] = "#{output[-1]}\n"
		line << output.join(",")
	end
	t = Time.now - t
	p t
end


