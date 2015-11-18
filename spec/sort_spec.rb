require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require '../lib/sort.rb'



describe 'sort' do

	it "Bogosort doesn't sort properly" do
		10.times do 
			array = (1..4).to_a.shuffle
			bogosort(array).must_equal array.sort
		end
	end

	it "Bubblesort doesn't sort properly" do
		10.times do 
			array = (1..100).to_a.shuffle
			bubblesort(array).must_equal array.sort
		end
	end

	it "Gnomesort doesn't sort properly" do
		10.times do 
			array = (1..100).to_a.shuffle
			gnomesort(array).must_equal array.sort
		end
	end

	it "Selectionsort doesn't sort properly" do
		10.times do 
			array = (1..100).to_a.shuffle
			selectionsort(array).must_equal array.sort
		end
	end

	it "Insertionsort doesn't sort properly" do
		10.times do 
			array = (1..100).to_a.shuffle
			insertionsort(array).must_equal array.sort
		end
	end

	it "Shellsort doesn't sort properly" do
		10.times do 
			array = (1..100).to_a.shuffle
			shellsort(array).must_equal array.sort
		end
	end

	it "Radixsort doesn't sort properly" do
		10.times do 
			array = (1..100).to_a.shuffle
			radixsortlsd(array).must_equal array.sort
		end
	end
end