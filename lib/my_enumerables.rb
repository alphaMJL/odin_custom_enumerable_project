# The following are the methods I wrote. The goal was to work with rspec, working with blocks, and to gain a better understanding of included ruby methods
# These methods could be improved with error handling
# All tests passed

module Enumerable
  # Your code goes here
  # return true if all array elements passed to the block return true
  def my_all?
    result = true
    
    my_each do |element|
      result = false unless yield(element)
    end
    result
  end
  # return true if any array elements passed to the block return true
  def my_any?
    my_each do |element|
      if yield(element)
        return true
      end
    end
    return false
  end

  # if block_given return count of elements that eval to true from block
  # else return size of array
  def my_count
    count = 0
    if block_given?
      my_each do |element|
        if yield(element)
          count += 1
        end
      end
      count
    else
      my_each do
        count += 1
      end
      count
    end
  end

  # do block on each element and each index
  def my_each_with_index
    my_each do |element, index|
      yield(element, index)
    end
    return self
  end
  # reduce array to one value, return value
  def my_inject(initial)
    total = initial
    my_each do |element|
      total = yield(total, element)
    end
    total
  end
  # do block on each element, and return an array with all of the modified elements
  def my_map
    new_array = []
    my_each do |element|
      new_array.push(yield(element))
    end
    return new_array
  end

  # do block on each element, return true if all block return false
  def my_none?
    result = true
    my_each do |element|
      return false if yield(element)
    end
    result
  end
  #return array that contains only elements where the block passed returned true
  def my_select
    new_array = []
    my_each do |element|
      if yield(element)
        new_array.push(element)
      end
    end
    return new_array
  end


end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    index = 0
    if block_given?
      while index < self.count
        yield(self[index], index)
        index += 1
      end
    end
    return self
  end
end
