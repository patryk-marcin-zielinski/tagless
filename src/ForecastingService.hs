module ForecastingService where

import City

data Temp = Temp Int deriving Show
data Forecast = Forecast Temp deriving Show

thirdParty :: Host -> Port -> City -> Forecast
thirdParty _ _ (City "Wrocław") = Forecast $ Temp 7
thirdParty _ _ (City "Cadiz") =  Forecast $ Temp 25

