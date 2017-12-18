module Main where

import Test.HUnit
import BagTest(tests)

main = do
        print "Digite sua matricula: "
        matricula <- getLine

        results <- runTestTT tests

        let totalTestes = cases results
        let tentativas = tried results
        let erros = errors results
        let falhas = failures results
        let passaram = tentativas - (erros + falhas)
        let jsonString = "{" ++ "\"matricula\":" ++ show matricula ++ ", "
                             ++ "\"totalTestes\":" ++ show totalTestes ++ ", "
                             ++ "\"erros\":" ++ show erros ++ ", "
                             ++ "\"falhas\":" ++ show falhas ++ ", "
                             ++ "\"passaram\":" ++ show passaram ++ "}"

        writeFile "test-output.json" (jsonString)
