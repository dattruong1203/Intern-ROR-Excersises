require 'pry'

def find_triples(arr, sum)

  # Biến a, b, c là index duyệt qua các phần tử trong mảng arr
  a, b, c = 0, 1, 2

  # Mảng arr_of_triples lưu các mảng con là bộ ba số từ mảng arr mà thỏa điều kiện đề bài
  arr_of_triples = []
  
  while a <= arr.length - 3
    arr_of_triples << [arr[a], arr[b], arr[c]] if arr[a] + arr[b] + arr[c] == sum

    if c == arr.length - 1 && b == arr.length - 2
      a += 1
      b = a + 1
      c = b + 1
    elsif c == arr.length - 1
      b += 1
      c = b + 1
    else
      c += 1
    end

  end

  arr_of_triples
end

numbers = [12, 3, 1, 2, -6, 5, -8, 6]
target_sum = 0

print find_triples(numbers, target_sum)

