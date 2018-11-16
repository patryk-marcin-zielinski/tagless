module Main where

import City
import WeatherForecast
import Control.Monad.Except
import Control.Monad.Reader

main :: IO ()
main = do
    let config = Config (Host "http://test.test") (Port "123123")
    forcasting <- (runReaderT $ runExceptT askForecast) config
    case (forcasting) of
        Left e -> putStrLn $ show e
        Right forcast -> putStrLn $ show forcast