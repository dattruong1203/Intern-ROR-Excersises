def is_order(arr, sub_arr)

  # Khai báo biến j index của mảng phụ sub_arr
  # Biến j đồng thời đếm số lần phần tử trong mảng con xuất hiện trong mảng chính
  j = 0
  
  (0..arr.length - 1).each do |i|
    # So sánh từng phần tử trong mảng chính với mảng phụ
    # Nếu bằng nhau thì index của mảng phụ tăng thêm 1
    if arr[i] == sub_arr[j]
      j += 1
    end
  end

  # ===================================================================
  # Vì j đếm số lần phần tử trong mảng con xuất hiện trong mảng chính.
  # Nếu số lần phần tử trong mảng phụ xuất hiện trong mảng chính bằng
  # với số lượng số lượng phần tử trong mảng con thì chứng tỏ mảng phụ
  # chính là con của mảng chính.
  # ===================================================================
  if j == sub_arr.length
    return true
  else
    return false
  end
end

puts(is_order([5, 1, 22, 26, 6, -1, 8, 10], [1, 6, -1, 10]))
puts(is_order([5, 1, 22, 26, 6, 10, -1, 8], [1, 6, -1, 10]))
