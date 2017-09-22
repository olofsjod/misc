import System.IO

main = do
  putStrLn "What to do?"
  todoItem <- getLine
  appendFile "todo.txt" (todoItem ++ "\n")
