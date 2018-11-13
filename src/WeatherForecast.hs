module WeatherForecast where

import City
import ForecastingService
import Control.Monad.Except

askQuestion :: String -> IO String
askQuestion str = do
    putStrLn str
    getLine

fetchHost :: Config -> Host
fetchHost = _host

fetchPort :: Config -> Port
fetchPort = _port

findCityByName :: String -> Either Error City
findCityByName "Wrocław" = Right $ City "Wrocław"
findCityByName "Cadiz" = Right $ City "Cadiz"
findCityByName "Londyn" = Right $ City "Londyn"
findCityByName name = Left $ UnknownCity name

type Forcast a = ExceptT Error IO a

askForecast :: Forcast ()
askForecast = do
    lift $ putStrLn "What is the city"
    potencialCity <- lift getLine
    city <- return $ findCityByName potencialCity
--     forcast <- thirdParty city
    lift $ putStrLn $ "City = " ++ (show city)

