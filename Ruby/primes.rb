up_to = 15000
puts "Search for all primes up to #{up_to}. Time now = #{Time.now()}"
ints_up_to = (2..up_to).to_a()
primes = []
p = np = ints_up_to[0]
primes.push(ints_up_to.shift())
while not ints_up_to.empty?
  # puts "Remaining integers: #{ints_up_to.join(' ')}"
  np += p
  if np > ints_up_to[-1]
    # puts "Prime-multiple has exceeded the largest number in the list"
    p = np = ints_up_to[0]
    # puts "Found a new prime number #{p}"
    primes.push(ints_up_to.shift())
    next
  end
  # puts "search for np = #{np}"
  if ints_up_to.member?(np)
    # puts "delete non-prime number #{np} from the list"
    ints_up_to.delete(np)
  end
end

puts "Finished the search at #{Time.now()}. Total primes found: #{primes.length()}"
puts "Primes list: #{primes.join(' ')}"

def is_prime(n)
  ("1" * n) !~ /^1?$|^(11+?)\1+$/
end

puts primes.all? { |i| is_prime(i) }
puts "Time when backtracking regex finally finished its checks: #{Time.now()}"
