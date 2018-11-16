{-# LANGUAGE FlexibleContexts #-}
module WeatherForecast where

import City
import ForecastingService
import Control.Monad.Except
import Control.Monad.Reader

askQuestion :: (MonadIO m) => String -> m String
askQuestion str = do
    liftIO $ putStrLn str
    liftIO $ getLine

fetchHost ::(MonadReader Config m) => m Host
fetchHost = asks _host

fetchPort :: (MonadReader Config m) => m Port
fetchPort = asks _port

findCityByName :: (MonadError Error m) =>  String -> m City
findCityByName "Wrocław" = return $ City "Wrocław"
findCityByName "Cadiz" = return $ City "Cadiz"
findCityByName "Londyn" = return $ City "Londyn"
findCityByName name = throwError $ UnknownCity name


askForecast :: (MonadReader Config m, MonadIO m, MonadError Error m)  => m ()
askForecast = do
    potencialCity <- askQuestion "What is the city"
    host <- fetchHost
    port <- fetchPort
    city <- findCityByName potencialCity
    forcast <- liftIO $ thirdParty host port city
    liftIO $ putStrLn $ "City = " ++ (show forcast)
