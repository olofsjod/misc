doubleMe x = x + x

doubleUs x y = doubleMe $ x+y

doubleSmallNumber x = if x > 100
                         then x
                         else doubleMe x

doubleSmallNumber' x = (if x > 100 then x else doubleMe x) + 1


