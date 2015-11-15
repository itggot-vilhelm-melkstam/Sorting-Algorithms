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
	
	(ary.length).times do |index|
		(index).times do |time|
			if ary[index-time] < ary[index-time-1]
				ary[index-time], ary[index-time-1] = ary[index-time-1], ary[index-time]
			else
				break
			end
		end
	end
	return ary
end

def selectionsort(array)
	ary = array.dup
	n = ary.length - 1

	n.times do |i|
		index_min = i

		(i + 1).upto(n) do |j|
		  index_min = j if ary[j] < ary[index_min]
		end
		  
		ary[i], ary[index_min] = ary[index_min], ary[i] if index_min != i
	end

	return ary
end

def insertionsort(array)
	ary = array.dup
	
	1.upto(ary.length-1) do |index|
		ins = index
		1.upto(index) do |time|
			if ary[index-time] > ary[index]
				ins = index-time
			else
				break
			end
		end
		ary.insert(ins, ary.delete_at(index))
	end
	return ary
end