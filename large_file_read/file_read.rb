require 'benchmark'
require 'csv'

class Row
  def initialize(id, id2)
    @id = id
    @id2 = id2
  end
end

StructRow = Struct.new(:id, :id2)

file_name = "bigfile.txt"
Benchmark.bm(30) do |x|
  x.report('readlines') { File.readlines(file_name) }
  x.report('each_line') { File.new(file_name).each_line { |l| l } }
  x.report("CSV.parse") { CSV.parse("bigfile.csv") }
  x.report("CSV.for_each") { CSV.foreach("bigfile.csv") { |r| r } }
  x.report("CSV.for_each with class") { CSV.foreach("bigfile.csv") { |r| Row.new(r[0], r[1]) } }
  x.report("CSV.for_each with struct") { CSV.foreach("bigfile.csv") { |r| StructRow.new(r[0], r[1]) } }
end
