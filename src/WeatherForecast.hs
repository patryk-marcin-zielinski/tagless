module WeatherForecast where

import City
import ForecastingService
import Control.Monad.Except
import Control.Monad.Reader

askQuestion :: String -> IO String
askQuestion str = do
    putStrLn str
    getLine

fetchHost :: ReaderT Config IO Host
fetchHost = ReaderT $ return . _host

fetchPort :: ReaderT Config IO Port
fetchPort =  ReaderT $ return . _port

findCityByName :: String -> ExceptT Error IO City
findCityByName "Wrocław" = return $ City "Wrocław"
findCityByName "Cadiz" = return $ City "Cadiz"
findCityByName "Londyn" = return $ City "Londyn"
findCityByName name = throwError $ UnknownCity name

type Forcast a = ExceptT Error (ReaderT Config IO) a

askForecast :: Forcast ()
askForecast = do
    toForcast $ putStrLn "What is the city"
    potencialCity <- toForcast getLine
    host <- lift $ fetchHost
    port <- lift $ fetchPort
    city <- mapExceptT lift (findCityByName potencialCity)
    forcast <- toForcast  $ return $ thirdParty host port city
    toForcast $ putStrLn $ "City = " ++ (show forcast)
    where
        toForcast = lift . lift
