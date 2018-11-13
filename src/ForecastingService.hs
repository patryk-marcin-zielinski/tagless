module ForecastingService where

import City

data Temp = Temp Int deriving Show
data Forecast = Forecast Temp deriving Show

thirdParty :: City -> Forecast
thirdParty (City "Wrocław") = Forecast $ Temp 7
thirdParty (City "Cadiz") =  Forecast $ Temp 25

