require 'pry'

class Bai3

  def initialize
    @arr = []
    input_total_number
  end

  # ======================================= #
  # Hàm sub_array_increase xuất mảng con tăng 
  # ======================================= #
  
  def sub_array_increase

    if @arr.length == 0
      puts "There is no sub increametal array"
      return
    end
    
    main_array = @arr
    sub_array = [main_array.first]
    main_array.delete_at(0)
    turns = 1
    
    loop do

      # Xuất mảng con cuối cùng
      if main_array.length == 0 && sub_array.length != 0
        print "sub increametal array #{turns} is #{sub_array}\n"
        break
      end

      # Tìm mảng con tăng
      # Thêm phần tử vào mảng con và xóa phần tử đó trong mảng chính
      if sub_array.last < main_array.first
        sub_array << main_array.first
        main_array.delete_at(0)
      # Xuất mảng con khi đã xác định được mảng con tăng
      else
        print "sub increametal array #{turns} is #{sub_array}\n"
        turns += 1
        sub_array = [main_array.first]
        main_array.delete_at(0)
      end
      
    end
  end

  
  private

  # =========================================== #
  # Hàm input_total_number nhập tổng số phần tử  
  # =========================================== #
  
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


  # ========================================== #
  # Hàm input_total_number_validator dùng để    
  # kiểm tra số n nhập từ bằn phím có thỏa điều     
  # kiện đề bài
  # ========================================== #

  def input_total_number_validator( input )
    if input.to_i >= 0 && input.to_i <= 99 && input.scan(/\D/).empty? && input != ""
      return true
    else
      return false
    end
  end


  # ==================================== #
  # Hàm create_random_array tạo một hàm   
  # gồm n phần tử ngẫu nhiên, giá trị     
  # phần tử nằm trong khoảng từ 1 đến 9  
  # ==================================== #
  
  def create_random_array( end_number )
    start_number = 1
    while start_number <= end_number
      @arr << rand(1..9)
      start_number += 1
    end
  end

end

ob = Bai3.new
ob.sub_array_increase

