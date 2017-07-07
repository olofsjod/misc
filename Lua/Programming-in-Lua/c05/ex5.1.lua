function conc(...)
   ret = ""
   for k,v in ipairs{...} do
      ret = ret .. v
   end
   return ret
end
