import System.IO
import System.Directory
import System.Environment
import Data.List
import Control.Exception

main = do
  (command:argList) <- getArgs
  dispatch command argList
  
dispatch :: String -> [String] -> IO ()
dispatch "add" = add
dispatch "view" = view
dispatch "remove" = remove
dispatch command = doesntExist command

doesntExist :: String -> [String] -> IO ()
doesntExist command _ =
  putStrLn $ "The " ++ command ++ " command doesn't exist"

add :: [String] -> IO ()
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")

view :: [String] -> IO ()
view [fileName] = do
  contents <- readFile fileName
  let todoTasks = lines contents
      numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
  putStr $ unlines numberedTasks

remove :: [String] -> IO ()
remove [fileName, todoItem] = do
  contents <- readFile fileName
  let todoTasks = lines contents
      numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks

      number = read todoItem
      newTodoItems = unlines $ delete (todoTasks !! number) todoTasks

  bracketOnError (openTempFile "." "temp") (\(tempName, tempHandle) -> do
                                               hClose tempHandle
                                               removeFile tempName) (\(tempName, tempHandle) -> do
                                                                        hPutStr tempHandle newTodoItems
                                                                        hClose tempHandle
                                                                        removeFile "todo.txt"
                                                                        renameFile tempName "todo.txt")
  
  
