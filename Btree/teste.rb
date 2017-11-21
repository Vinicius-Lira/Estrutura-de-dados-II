a = []
a << 4 << 10 << 5 << 1

i = 0
j = 0
while i < 4
  j = 0
  while j < 4
    if a[i].to_i < a[i + 1].to_i
      aux = a[i + 1]
      a[i + 1] = a[i]
      a[i] = aux
    end
    j = j + 1
  end
  i = i + 1
end

a = a.reverse
print "#{a}\n"
