main = do
  putStrLn "Hello, what's your name?"
  name <- getLine
  putStrLn $ "Zis is your future: " ++ tellFortune name

tellFortune :: String -> String
tellFortune n = "You have no future " ++ n
