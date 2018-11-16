module ForecastingService where

import City

data Temp = Temp Int deriving Show
data Forecast = Forecast Temp deriving Show

thirdParty :: Host -> Port -> City -> IO Forecast
thirdParty _ _ (City "Wrocław") = return $ Forecast $ Temp 7
thirdParty _ _ (City "Cadiz") =  return $ Forecast $ Temp 25

