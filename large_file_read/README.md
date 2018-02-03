# About

General IO method comparison between crystal and ruby, nameily enumerable methods.

# Usage


```
# makes a file of 10_000_000 rows
ruby generate.rb
ruby file_read.rb
crystal file_read.cr --release
rm bigfile.txt
```

Results:

## Ruby

```
▶ ruby file_read.rb
                                     user     system      total        real
readlines                        1.360000   0.290000   1.650000 (  1.883492)
each_line                        1.160000   0.140000   1.300000 (  1.309485)
CSV.parse                        0.000000   0.000000   0.000000 (  0.002022)
CSV.for_each                    33.720000   0.400000  34.120000 ( 34.355656)
CSV.for_each with class         38.150000   0.460000  38.610000 ( 39.250510)
CSV.for_each with struct        36.070000   0.240000  36.310000 ( 36.593392)
```

## Crystal

```
▶ crystal file_read.cr --release
                               user     system      total        real
File.read_lines            0.770000   0.170000   0.940000 (  0.713304)
File.each_line             0.310000   0.070000   0.380000 (  0.385935)
CSV.parse                  0.000000   0.000000   0.000000 (  0.000010)
CSV.each_row               7.110000   0.090000   7.200000 (  7.221214)
CSV.each_row with class    7.160000   0.090000   7.250000 (  7.264542)
CSV.each_row with struct   7.130000   0.080000   7.210000 (  7.231781)
```
