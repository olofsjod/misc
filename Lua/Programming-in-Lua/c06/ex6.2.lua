function newpoly(t)
   return function(x)
      ret = 0
      for i = 1, #t do
	 ret = ret + t[i]*(x^(i-1))
      end
      return ret
   end
end
