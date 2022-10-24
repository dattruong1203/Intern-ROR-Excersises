# require 'pry'

module Validator
  
  # ======================================================================================== #
  # Hàm validatorToTalNumber dùng để kiểm tra tổng số phần tử có nằm trong khoảng từ 0 đến 99 #
  # ======================================================================================== #
  
  def validatorToTalNumber( input )
    if input.to_i >= 0 && input.to_i <= 99 && input.scan(/\D/).empty? && input != ""
      return true    # Bắt đầu nhập phần tử vào mảng khi đầu vào thỏa điều kiện
    else
      return false   # Nhập lại tổng số phần tử mảng khi đầu vào không thỏa điều kiện
    end
  end
  

  # ==================================================================================== #
  # Hàm  dùng để kiểm tra phần tử được nhập vào từ bàn phím có phải là số tự nhiên không #
  # ==================================================================================== #
  
  def validatorElements( input )
    if input.scan(/\D/).empty? && input != ""
      return true   # Dữ liệu nhập từ bàn phím là số tự nhiên
    else
      puts("\nElement must be a natural number")
      return false  # Dữ liệu nhập từ bàn phím không phải là số tự nhiên
    end
  end
  
end


class MinElementsInArray

  # Module có những hàm giúp có thể check kết quả nhập từ bàn phím thỏa điều kiện đề bài
  include Validator
  
  def initialize
    @index = 1
    @arr = []
  end

  
  # =================================== #
  # Hàm inputArray dùng để nhập dữ liệu #
  # =================================== #
  
  def inputArray
    inputTotalNumber  # Hàm nhập tổng số phần tử mảng
    inputElements     # Hàm nhập phần tử vào mảng
  end

  
  # ==================================== #
  # Hàm outputArray dùng để xuất dữ liệu #
  # ==================================== #

  def outputArray
    puts "Array has #{@arr.length} elements: \n#{@arr}"
    if @arr.length == 0 
      puts "Min value is not available"
    else
      puts "Min value is #{@minValue}"
    end
  end

  private

  # ========================================================= #
  # Hàm inputTotalNumber dùng để nhập tổng số phần tử của mảng #
  # ========================================================= #
  
  def inputTotalNumber
    begin
      print "Type total number of elements in array: "
      @total = gets.chomp

      # Dừng chương trình khi nhập -1
      return if @total.to_i == -1

      # Kiểm tra tổng số phần tử nằm trong khoảng từ 0 đến 99
      unless validatorToTalNumber( @total ) 
        raise "Total number must be integer and between 0 and 99"
      end
    rescue Exception => err
      puts( err.to_s )
      retry
    end
  end

  
  # ============================================== #
  # Hàm inputElements dùng để nhập phần tử vào mảng #
  # ============================================== #

  def inputElements
    while @index <= @total.to_i do
      print "input element #{@index}: "
      @element = gets.chomp

      # Dừng chương trình khi nhập -1
      return if @element.to_i == -1
        
      if validatorElements( @element )   # Kiếm tra số nhập từ bàn phím
        @arr << @element.to_i
        checkMinValue( @element.to_i )      # Kiếm tra giá trị nhỏ nhất
        @index += 1
      end
    end
  end


  # ============================================================================ #
  # Hàm checkMinValue dùng để theo dõi giá trị nhỏ nhất trong quá trình nhập mảng #
  # ============================================================================ #
  
  def checkMinValue(value)
    if @index == 1            # khởi tạo biến @minValue, Mặc định gán giá trị nhỏ nhất là phần tử đầu tiên khi mới nhập mảng
      @minValue = value
    elsif value < @minValue   # Tiến hành so sánh và gán giá trị nhỏ hơn vào biến sau khi khởi tạo biến @minValue
      @minValue = value
    end
  end
  
end


# ob = MinElementsInArray.new
# ob.inputArray
# ob.outputArray

