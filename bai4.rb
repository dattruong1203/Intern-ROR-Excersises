require 'pry'

def find_pair(arr, sum)

  # Biến i và j đều là index của mảng
  # i là index để kiểm tra điều kiện vòng lặp và tìm số bị trừ của từng phần tử trong mảng
  # j là index để so sánh số bị trừ với phần tử trong mảng
  i = 0    
  j = i    
  
  while i != arr.length

    # Tìm số bị trừ
    subtrahend = sum - arr[i]

    # Nếu số bị trừ vừa tìm được xuất hiện trong mảng chính
    # thì chứng tỏ là trong mảng tồn tại 1 cặp số có tổng
    # bằng tổng cho trước ( sum )
    if subtrahend != arr[j] || i == j
      j += 1
    else
      return [arr[i], subtrahend]
    end

    if j == arr.length
      i += 1
      j = i
    end
  end

  return []
  
end

numbers = [3, 5, -4, 8, 11, 1, -1, 6]
target_sum = 10

print find_pair(numbers, target_sum)
