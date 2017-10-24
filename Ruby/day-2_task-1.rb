#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
a = (1..16).to_a()
a.each do |elem|
  i = a.index(elem)
  if i % 4 == 0
    puts "#{a[i]} #{a[i+1]} #{a[i+2]} #{a[i+3]}"
  end
end
