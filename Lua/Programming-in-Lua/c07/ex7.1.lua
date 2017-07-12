local function iter(arr, i)
   i = i + 1
   local v = arr[i]

   if v then
      return i, v
   end
end

function fromto(n, m)
   return iter, {n, m}, 0
end

n=1
m=2
for i in fromto(n, m) do
   print(i)
end
