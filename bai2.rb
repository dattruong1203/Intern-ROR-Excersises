require 'pg'
require 'benchmark'
require 'csv'
require 'pry'

class Bai2
  
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


  def generate_csv
    CSV.open("#{@table_name}.csv", "w") do |csv|
      500000.times do |i|
        csv << [i + 1, "Steve Jobs", "unkown@mail.com", "01436597254", "Silicon valley", "24/02/1955", "The great man !!!"]
      end  
    end
  end
  
    
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
  

  def import_to_database_insert
    CSV.foreach("#{@table_name}.csv", headers: true) do |row|
      @@conn.exec("INSERT INTO test (id, name, email, phone, address, date_of_birth, profile)
       VALUES (#{row[0]}, '#{row[1]}', '#{row[2]}', '#{row[3]}', '#{row[4]}', '#{row[5]}', '#{row[6]}')
     ")
    end
  end
  

  def import_to_database

    file_path = File.expand_path(File.dirname("#{@table_name}.csv")) + "/#{@table_name}.csv"
    
    @@conn.exec "
      COPY #{@db_name} (id, name, email, phone, address, date_of_birth, profile)
      from '#{file_path}'
      CSV DELIMITER ',';
      "

  end

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

puts Benchmark.realtime {
  ob.import_to_database
}

