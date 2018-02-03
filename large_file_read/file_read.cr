require "benchmark"
require "csv"

class Row
  def initialize(@id : String, @id2 : String)
  end
end

struct StructRow
  def initialize(@id : String, @id2 : String)
  end
end

Benchmark.bm do |x|
  x.report("File.read_lines") { File.read_lines("bigfile.txt") }
  x.report("File.each_line") { File.each_line("bigfile.txt") { |l| l } }
  x.report("CSV.parse") { CSV.parse("bigfile.csv") }
  x.report("CSV.each_row") { CSV.each_row(File.new("bigfile.csv")) { |r| r } }
  x.report("CSV.each_row with class") do
    CSV.each_row(File.new("bigfile.csv")) { |r| Row.new(r[0], r[1]) }
  end
  x.report("CSV.each_row with struct") do
    CSV.each_row(File.new("bigfile.csv")) { |r| StructRow.new(r[0], r[1]) }
  end
end
