module City where

newtype Host = Host String
newtype Port = Port String

data City = City String deriving Show

data Config = Config {
    _host :: Host,
    _port :: Port
}

data Error = UnknownCity String deriving Show

