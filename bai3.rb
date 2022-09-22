require 'pry'

class Bai3

  def initialize
    @list_of_array = {}
    input_total_number
  end

  
  def sub_array_increase
    binding.pry
    sub = 1
    @list_of_array[:sub] = []
    minValue = @list_of_array[:total][0]
    @list_of_array[:sub] << minValue
    (1..@list_of_array[:total].length).each do |index|
      if @list_of_array[:total][index] < minValue
        @list_of_array[:sub][index], minValue = minValue, @list_of_array[:sub][index]
        @list_of_array[:sub] << minValue
      else
        sub += 1
        print "The sub-array-increasement #{sub}: #{@list_of_array[:sub]}"
      end
    end
     # print "#{@list_of_array[:total]}\n"
  end

  
  private
  
  def input_total_number
    begin
      print "Please enter a number: "
      total = gets.chomp
      if input_total_number_validator( total )
        create_random_array( total.to_i )
      else
        raise "Total number must be natural number and between 0 and 99. Please enter again !!!"
      end
    rescue Exception => e
      puts e.to_s
      retry
    end
  end


  def input_total_number_validator( input )
    if input.to_i >= 0 && input.to_i <= 99 && input.scan(/\D/).empty? && input != ""
      return true
    else
      return false
    end
  end

  
  def create_random_array( end_number )
    start_number = 0
     @list_of_array[:total] = []
    while start_number <= end_number
      @list_of_array[:total] << rand(1..9)
      start_number += 1
    end
  end

end

ob = Bai3.new
ob.sub_array_increase
