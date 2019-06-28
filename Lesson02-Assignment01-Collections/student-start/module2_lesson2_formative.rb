# Grab 23 random elements between 0 and 10000
p (1..10000).to_a.sample(23).select { |element| (element % 3 == 0 and (element > 5000)) }.sort.reverse



