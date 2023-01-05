{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-unused-top-binds #-}

module Main (main) where

import Network.Simple.TCP (HostPreference (HostAny), closeSock, serve)

main :: IO ()
main = do
  let port = "6379"
  putStrLn $ "Redis server listening on port " ++ port

  serve HostAny port $ \(socket, address) -> do
    putStrLn $ "successfully connected client: " ++ show address
    closeSock socket
