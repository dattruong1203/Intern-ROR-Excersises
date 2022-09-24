require 'pg'
require 'benchmark'
require 'csv'

class Bai2

  # Khởi tạo kết nối đến database
  @@conn = PG.connect(
    dbname: "mydatabase",
    port: 5432,
    user: "tandat",
    password: "1111"
  )

  
  def initialize( table_name, db_name )
    @table_name = table_name
    @db_name = db_name
  end


  # =============================
  # Hàm generate_csv tạo file csv
  # =============================
  
  def generate_csv
    CSV.open("#{@table_name}.csv", "w") do |csv|
      500000.times do |i|
        csv << [i + 1, "Steve Jobs #{i}", "unkown#{i}@mail.com", "01436597254", "Silicon valley", "24/02/1955", "The great man !!!"]
      end  
    end
  end

  
  # ========================================
  # Hàm create_table tạo bảng trong database
  # ========================================
  
  def create_table
    @@conn.exec "
    CREATE TABLE IF NOT EXISTS #{@db_name} (
     id SERIAL PRIMARY KEY,
     name TEXT ,
     email TEXT ,
     phone TEXT ,
     address TEXT ,
     date_of_birth TEXT,
     profile TEXT
     );"
  end
  

  # =========================================
  # Hàm import_to_database sẽ import file csv
  # đã tạo vào database
  # =========================================
  
  def import_to_database

    # Đọc đường dẫn của file csv
    file_path = File.expand_path(File.dirname("#{@table_name}.csv")) + "/#{@table_name}.csv"

    # Import vào postgres thông qua việc thực thi lệnh copy
    @@conn.exec "
      COPY #{@db_name} (id, name, email, phone, address, date_of_birth, profile)
      from '#{file_path}'
      CSV DELIMITER ',';
      "

  end


  # ==========================================
  # Hàm drop_table để xóa table trong database
  # ==========================================
  
  def drop_table
    @@conn.exec "
     DROP TABLE IF EXISTS #{@db_name}
     "
  end

end

ob = Bai2.new("posts", "test")
ob.drop_table
ob.generate_csv
ob.create_table

# Xuất thời gian thực thi import file csv vào database (Thời gian thực thi trên dưới 2s)
puts Benchmark.realtime {
  ob.import_to_database
}

