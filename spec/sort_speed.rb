length = 1000
random = []
(length).times { random << rand(0..length*10) }
fewunique = []
(length).times { fewunique << rand(0..10) }
almostsorted = []
(length).times { almostsorted << rand(almostsorted.length..almostsorted.length+10) }
descending = (0..length).to_a.reverse!

Benchmark.bm(16) do |x|
	puts "Random"
	x.report("Bubblesort") { bubblesort(random) }
	x.report("Gnomesort:") { gnomesort(random) }
	x.report("Selectionsort:") { selectionsort(random) }

	puts "\nFew unique"
	x.report("Bubblesort:") { bubblesort(fewunique) }
	x.report("Gnomesort:") { gnomesort(fewunique) }
	x.report("Selectionsort:") { selectionsort(fewunique) }

	puts "\nNearly Sorted"
	x.report("Bubblesort:") { bubblesort(almostsorted) }
	x.report("Gnomesort:") { gnomesort(almostsorted) }
	x.report("Selectionsort:") { selectionsort(almostsorted) }

	puts "\nDescending"
	x.report("Bubblesort:") { bubblesort(descending) }
	x.report("Gnomesort:") { gnomesort(descending) }
	x.report("Selectionsort:") { selectionsort(descending) }
end