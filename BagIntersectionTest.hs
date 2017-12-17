module BagSearchTest(tests_intersection) where

import Test.HUnit
import Bag


test_intersection_1 = "Test get intersection between a no-empty Bag A and an empty Bag B" ~:
                      "Get intersection between a no-empty Bag A and an empty Bag B should return []"  ~:
                      (intersection [(2,1)] []) ~?= []

test_intersection_2 = "Test get intersection between an empty Bag A and a no-empty Bag B" ~:
                      "Get intersection between an empty A and a no-empty Bag B should return []"  ~:
                      (intersection [] [(2,1)]) ~?= []

test_intersection_3 = "Test get intersection between Bag A and Bag A" ~:
                      "Get intersection between Bag A and Bag A should return itself"  ~:
                      (intersection [(2,1), ('a',1)] [(2,1), ('a',1)]) ~?= [(2,1), ('a',1)]

test_intersection_4 = "Test get intersection between Bags with no intersection" ~:
                      "Get intersection between Bags with no intersection should return []"  ~:
                      (intersection [(2,1)] [('a',1)]) ~?= []

test_intersection_5 = "Test get intersection between Bag A and Bag B where B is a subset of A" ~:
                      "Get intersection between Bag A and Bag B where B is a subset of A should return B"  ~:
                      (intersection [(2,1), ('a',1)] [('a',1)]) ~?= [('a',1)]

test_intersection_6 = "Test get intersection between Bag A and Bag B where A is a subset of B" ~:
                      "Get intersection between Bag A and Bag B where A is a subset of B should return A"  ~:
                      (intersection [(2,1), ('a',1)] [(2,1)]) ~?= [(2,1)]

test_intersection_6 = "Test get intersection between Bag A and Bag B where A has the element (2,2) and B has the element (2,1)" ~:
                      "Get intersection between Bag A and Bag B should return [(2,1)]"  ~:
                      (intersection [(2,2), ('a',1)] [(2,1)]) ~?= [(2,1)]

test_intersection_7 = "Test get intersection between Bag A and Bag B where A has the element (2,2) and B has the element (2,1)" ~:
                      "Get intersection between Bag A and Bag B should return [(2,1)]"  ~:
                      (intersection [(2,1), ('a',1)] [('a',2)]) ~?= [('a',1)]



tests_intersection = TestList[
                test_intersection_1,test_intersection_2,test_intersection_3,
                test_intersection_4,test_intersection_5,test_intersection_6,
                test_intersection_7]
                