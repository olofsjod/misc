import Control.Exception
import System.IO

main = do
  withFile' "girlfriend.txt" ReadMode (\handle -> do
                                         contents <- hGetContents handle
                                         putStr contents)


withFile' :: FilePath -> IOMode -> (Handle -> IO r) -> IO r
withFile' name mode f = bracket (openFile name mode) (\handle -> hClose handle) (\handle -> f handle)
