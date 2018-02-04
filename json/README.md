JSON parsing in ruby vs crystal

# Usage

```
ruby json.rb
crystal json.cr --release
```

# Results:

### Ruby

```
ruby json.rb
Warming up --------------------------------------
          small_json     5.124k i/100ms
          large_json   101.000  i/100ms
Calculating -------------------------------------
          small_json     54.701k (± 4.9%) i/s -    276.696k in   5.070506s
          large_json    994.655  (± 4.9%) i/s -      5.050k in   5.089422s

Comparison:
          small_json:    54701.1 i/s
          large_json:      994.7 i/s - 55.00x  slower
```


### Crystal

```
crystal json.cr --release
small_json 164.63k (  6.07µs) (± 4.12%)       fastest
large_json   3.57k (279.82µs) (± 4.10%) 46.07× slower
```
