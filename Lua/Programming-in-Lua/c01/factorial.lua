-- defines a factorial function

function factorial(n)
   if n == 0 then
      return 1
   else
      return n * factorial(n-1)
   end
end

print("enter a number:")
a = io.read("*n")  -- reads a number
print(factorial(a))
