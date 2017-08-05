import qualified Data.Map as Map

data LockerState = Taken | Free deriving (Show, Eq)

type Code = String

type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNo map = case Map.lookup lockerNo map of
  Nothing -> Left $ "Locker " ++ show lockerNo ++ " does not exist!"
  Just (state, code) -> if state /= Taken
                           then Right code
                        else Left $ "Locker " ++ show lockerNo
                             ++ " is already taken!"

lockers :: LockerMap
lockers = Map.fromList[(100, (Taken, "SG333"))
                      ,(101, (Free, "JI123"))
                      ]
                       
    
