class Array 
	def sorted?
		(self.length-1).times do |index|
			if self[index] > self[index+1]
				return false
			end
		end
		return true
	end
end

def bogosort(array)
	ary = array.dup
	while not ary.sorted?
		ary.shuffle!
	end
	return ary
end

def bubblesort(array)
	ary = array.dup
	n = ary.length-1
	swapped = true

  	while swapped do
    	swapped = false

    	(n).times do |i|
    		if ary[i] > ary[i+1]
        		ary[i], ary[i+1] = ary[i+1], ary[i]
        		swapped = true
      		end
    	end

    	n-=1
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

def shellsort(array)
	ary = array.dup
	k = ary.length/2

	while k > 0
		(ary.length-k).times do |index|
			((ary.length/k)-1).times do |time|
				if ary[index-time] > ary[(index+k)-time] && index-time >= 0
					ary[index-time], ary[(index+k)-time] = ary[(index+k)-time], ary[index-time]
				else
					break
				end
			end
		end
		k = k/2
	end

	return ary
end

def radixsortlsd(array)
	ary = array.dup
	k = 0

	ary.each { |value| k = value.to_s.length if value.to_s.length > k }
	ary.each_with_index {|value, index| ary[index] = value.to_s.rjust(k, "0").chars.map(&:to_i)}


	k.times do |digit|
		bucket = {0 => [], 1 => [], 2=> [], 3 => [], 4 => [], 5 => [], 6 => [], 7 => [], 8 => [], 9 => []}
		ary.each_with_index do |value, index|
			bucket[(value.reverse[digit])] << value
		end
		ary = []
		bucket.each do |key, value|
			value.each do |num|
				ary << num
			end
		end	
	end
	ary.each_with_index { |value, index| ary[index] = value.inject{|n, d| n * 10 + d} }

	return ary
end