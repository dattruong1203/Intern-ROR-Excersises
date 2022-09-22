require 'pry'

class Bai3

  def initialize
    @arr = []
    input_total_number
  end

  
  def sub_array_increase
    print "Main array is #{@arr}\n"
    
    main_array = @arr
    sub_array = [main_array.first]
    main_array.delete_at(0)
    turns = 1
    
    loop do

      if main_array.length == 0 && sub_array.length != 0
        print "sub array #{turns} is #{sub_array}\n"
        sub_array = []
        break
      end

      if sub_array.last < main_array.first
        sub_array << main_array.first
        main_array.delete_at(0)
      else
        print "sub array #{turns} is #{sub_array}\n"
        turns += 1
        sub_array = [main_array.first]
        main_array.delete_at(0)
      end
    end
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
    while start_number <= end_number
      @arr << rand(1..9)
      start_number += 1
    end
  end

end

ob = Bai3.new
ob.sub_array_increase

