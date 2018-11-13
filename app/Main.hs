module Main where

import WeatherForecast
import Control.Monad.Except

main :: IO ()
main = do
    forcasting <- runExceptT askForecast
    case forcasting of
        Left e -> putStrLn "Error"
        Right forcast -> putStrLn $ show forcast
