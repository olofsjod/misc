a = {}           -- create a table, and store its reference in variable a
k = "x"
a[k] = 10        -- add entry with key "x" with the value 10
a[20] = "great"
print(a["x"])
print(a[20])

a["x"] = a["x"] + 1 -- increments entry "x"
print(a["x"])

b = a   -- b refers to the same table as a
print(b["x"])

b["x"] = 20
print(a["x"])

a = nil     -- b still refers to the table
print(b["x"])
b = nil     -- no one refers to the table


c = {}
c["x"] = 30

print(c.x)
