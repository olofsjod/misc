-- Write a functions that calculates a polynomial {a_0, a_1, ... , a_n}

function calcPol(t, x)
   ret = 0

   for i = 1, #t do
      ret = ret + t[i]*(x^i)
   end
   
   return ret
end
