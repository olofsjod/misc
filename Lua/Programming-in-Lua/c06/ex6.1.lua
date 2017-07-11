function integral(f, delta)
   d = delta or 0.00004
   return function(x) return (f(x+d)-f(x))/d end
end
