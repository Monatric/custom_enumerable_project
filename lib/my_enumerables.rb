module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    self.my_each do |element|
      yield(element, index)
      index += 1
    end
    return self
  end

  def my_select
    result = []
    self.my_each { |element| result << element if yield(element) }
    return result
  end

  def my_all?
    all_status = true
    self.my_each { |element| all_status = false if yield(element) == false }
    return all_status
  end

  def my_any?
    any_status = false
    self.my_each { |element| any_status = true if yield(element) }
    return any_status
  end

  def my_none?
    none_status = true
    self.my_each { |element| none_status = false if yield(element) }
    return none_status
  end

  def my_count
    count = 0
      self.my_each do |element|
        if block_given?        
          count += 1 if yield(element)
        else
          count += 1
        end
      end
    return count
  end

  def my_map
    result = []
    self.my_each { |element| result << yield(element) }
    return result
  end

  def my_inject(initial)
    sum = initial
    self.my_each { |element| sum = yield(sum, element) }
    return sum
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self
      yield(element)
    end
    return self
  end
end
