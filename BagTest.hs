module BagTest(tests) where

import Test.HUnit

import BagInsertTest(tests_insert)
import BagRemoveTest(tests_remove)
import BagSearchTest(tests_search)
import BagUnionTest(tests_union)

tests = TestList[tests_insert, tests_remove, tests_search, tests_union]
