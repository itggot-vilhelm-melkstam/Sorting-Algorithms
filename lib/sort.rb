require 'benchmark'

class Array 

	def sorted?
		self.each_index do |index|
			if self[index+1] != nil
				if self[index] > self[index+1]
					return false
				end
			end
		end
		return true
	end

end

def bogosort(array)
	ary = array.dup
	while ary.sorted? == false
		ary.shuffle!
	end
	return ary
end

def bubblesort(array)
	ary = array.dup
	n = ary.length

  	loop do
    	swapped = false

    	(n-1).times do |i|
    		if ary[i] > ary[i+1]
        		ary[i], ary[i+1] = ary[i+1], ary[i]
        		swapped = true
      		end
    	end

    break if not swapped
	end

	return ary
end

def gnomesort(array)
	ary = array.dup
	n = ary.length

	(n - 1).times do |i|
		(i..1).each do |j|
			if ary[j] < ary[j-1]
				ary[j], ary[j-1] = ary[j-1], ary[j]
			else
				break
			end
		end
	end
	return ary
end

def selectionsort(array)
	ary = array.dup
	n = array.length - 1

	n.times do |i|
		index_min = i

		(i + 1).upto(n) do |j|
		  index_min = j if ary[j] < ary[index_min]
		end
		  
		ary[i], ary[index_min] = ary[index_min], ary[i] if index_min != i
	end

	return ary
end

def insertionsort(ary)
	
end

length = 10
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

p gnomesort(random)