require "benchmark"
# require "securerandom"
require "json"

small_json = ('a'..'z').to_a.each_with_object({} of Char => String) do |el, hash|
  hash[el] = Random.new.hex(8)
end.to_json

large_nested_json = ('a'..'z').each_with_object({} of Char => Hash(Char, Hash(Char, String))) do |el, hash|
  hash[el] = ('a'..'z').each_with_object({} of Char => Hash(Char, String)) do |el2, hash2|
    hash2[el2] = ('a'..'z').each_with_object({} of Char => String) do |el3, hash3|
      hash3[el] = Random.new.hex(8)
    end
  end
end.to_json

Benchmark.ips do |x|
  x.report("small_json") { JSON.parse(small_json) }
  x.report("large_json") { JSON.parse(large_nested_json) }
end
