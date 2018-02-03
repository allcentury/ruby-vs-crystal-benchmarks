require 'securerandom'
require 'csv'

File.open("bigfile.txt", "w") do |file|
  10_000_000.times { |i| file << "#{SecureRandom.hex(8)}\n" }
end
CSV.open("bigfile.csv", "w") do |csv|
  csv << ["id", "id2"] # header
  10_000_000.times { |i| csv << [SecureRandom.hex(8),SecureRandom.hex(4)] }
end
