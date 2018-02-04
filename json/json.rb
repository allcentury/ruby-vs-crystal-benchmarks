require 'benchmark/ips'
require 'securerandom'
require 'json'

small_json = ('a'..'z').to_a.each_with_object({}) do |el, hash|
  hash[el] = SecureRandom.hex(8)
end.to_json

large_nested_json = ('a'..'z').each_with_object({}) do |el, hash|
  hash[el] = ('a'..'z').each_with_object({}) do |el2, hash2|
    hash2[el2] = ('a'..'z').each_with_object({}) do |el3, hash3|
      hash3[el] = SecureRandom.hex(8)
    end
  end
end.to_json

Benchmark.ips do |x|
  x.report("small_json") { JSON.parse(small_json) }
  x.report("large_json") { JSON.parse(large_nested_json) }

  x.compare!
end
