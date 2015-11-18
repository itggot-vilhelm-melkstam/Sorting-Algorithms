require 'Benchmark'
require '../lib/sort.rb'

length = 5000
random = []
(length).times { random << rand(0..length*10) }
fewunique = []
(length).times { fewunique << rand(0..10) }
nearlysorted = []
(length).times { nearlysorted << rand(nearlysorted.length..nearlysorted.length+10) }
descending = (0..length).to_a.reverse!

Benchmark.bm(16) do |x|
	puts "Array length is #{length}"

	puts "\nRandom"
	x.report('Bubblesort') 		{ bubblesort(random) }
	x.report('Gnomesort:') 		{ gnomesort(random) }
	x.report('Selectionsort:') 	{ selectionsort(random) }
	x.report('Insertionsort:') 	{ insertionsort(random) }
	x.report('Shellsort:') 		{ shellsort(random) }
	x.report('Radixsort(lsd):') { radixsortlsd(random) }

	puts "\nFew unique"
	x.report('Bubblesort:') 	{ bubblesort(fewunique) }
	x.report('Gnomesort:') 		{ gnomesort(fewunique) }
	x.report('Selectionsort:') 	{ selectionsort(fewunique) }
	x.report('Insertionsort:') 	{ insertionsort(fewunique) }
	x.report('Shellsort:') 		{ shellsort(fewunique) }
	x.report('Radixsort(lsd):') { radixsortlsd(fewunique) }

	puts "\nNearly Sorted"
	x.report('Bubblesort:') 	{ bubblesort(nearlysorted) }
	x.report('Gnomesort:') 		{ gnomesort(nearlysorted) }
	x.report('Selectionsort:') 	{ selectionsort(nearlysorted) }
	x.report('Insertionsort:') 	{ insertionsort(nearlysorted) }
	x.report('Shellsort:') 		{ shellsort(nearlysorted) }
	x.report('Radixsort(lsd):') { radixsortlsd(nearlysorted) }

	puts "\nDescending"
	x.report('Bubblesort:') 	{ bubblesort(descending) }
	x.report('Gnomesort:') 		{ gnomesort(descending) }
	x.report('Selectionsort:') 	{ selectionsort(descending) }
	x.report('Insertionsort:') 	{ insertionsort(descending) }
	x.report('Shellsort:') 		{ shellsort(descending) }
	x.report('Radixsort(lsd):') { radixsortlsd(descending) }
end