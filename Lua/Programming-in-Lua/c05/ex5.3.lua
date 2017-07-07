function returnAllButFirst(...)
   local a = {...}
   ret = {}
   
   for i = 2, #a do
      ret[i-1] = a[i]
   end
   return table.unpack(ret)
end
