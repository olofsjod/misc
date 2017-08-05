data Binary = One | Zero deriving (Show)

xor' :: Binary -> Binary -> Binary
xor' One Zero = One
xor' Zero One = One
xor' _ _ = Zero

and' :: Binary -> Binary -> Binary
and' One One = One
and' _ _ = Zero

not' :: Binary -> Binary
not' One = Zero
not' Zero = One

nand' :: Binary -> Binary -> Binary
nand' a b = not' $ and' a b
