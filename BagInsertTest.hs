import Test.HUnit
import Bag

test_insert_1 = TestCase (assertEqual "Should be able to Insert Number in empty Bag" (insert 1 []) [(1, 1)])
test_insert_2 = TestCase (assertEqual "Should be able to Insert String in empty Bag" (insert "a" []) [("a", 1)])
test_insert_3 = TestCase (assertEqual "Should be able to Insert List in empty Bag" (insert [1, 2] []) [([1, 2], 1)])
test_insert_4 = TestCase (assertEqual "Should be able to Insert Number already in Bag" (insert 1 [(1, 1)]) [(1, 2)])
test_insert_5 = TestCase (assertEqual "Should be able to Insert Number already in Bag" (insert 1 [(2, 1), (1, 1)]) [(2, 1), (1, 2)])
test_insert_6 = TestCase (assertEqual "Should be able to Insert String already in Bag" (insert "a" [("a", 2)]) [("a", 3)])
test_insert_7 = TestCase (assertEqual "Should be able to Insert String already in Bag" (insert "ab" [("ab", 1), ("a", 2)]) [("ab", 2), ("a", 2)])
test_insert_8 = TestCase (assertEqual "Should be able to Insert List already in Bag" (insert [1] [([1], 4)]) [([1], 5)])
test_insert_9 = TestCase (assertEqual "Should be able to Insert List already in Bag" (insert [10, 2] [([10, 2], 1), ([2, 10], 1)]) [([10, 2], 2), ([2, 10], 1)])
test_insert_10 = TestCase (assertEqual "Should be able to Insert different Number in Bag" (insert 1 [(2, 1)]) [(2, 1), (1, 1)])
test_insert_11 = TestCase (assertEqual "Should be able to Insert different Number in Bag" (insert 3 [(2, 1), (1, 1)]) [(2, 1), (1, 1), (3, 1)])
test_insert_12 = TestCase (assertEqual "Should be able to Insert different String in Bag" (insert "a" [("b", 1)]) [("b", 1), ("a", 1)])
test_insert_13 = TestCase (assertEqual "Should be able to Insert different String in Bag" (insert "gu" [("leo", 1), ("vini", 1)]) [("leo", 1), ("vini", 1), ("gu", 1)])
test_insert_14 = TestCase (assertEqual "Should be able to Insert different List in Bag" (insert [0] [([0, 1], 1)]) [([0, 1], 1), ([0], 1)])
test_insert_15 = TestCase (assertEqual "Should be able to Insert different List in Bag" (insert [2, 1] [([1, 2], 1), ([2, 2], 1)]) [([1, 2], 1), ([2, 2], 1), ([2, 1], 1)])

tests_insert = TestList[
    TestLabel "Test Insert Number in Empty Bag" test_insert_1,
    TestLabel "Test Insert String in Empty Bag" test_insert_2,
    TestLabel "Test Insert List in Empty Bag" test_insert_3,
    TestLabel "Test Insert Number already in the Bag" test_insert_4,
    TestLabel "Test Insert Number already in the Bag" test_insert_5,
    TestLabel "Test Insert String already in the Bag" test_insert_6,
    TestLabel "Test Insert String already in the Bag" test_insert_7,
    TestLabel "Test Insert List already in the Bag" test_insert_8,
    TestLabel "Test Insert List already in the Bag" test_insert_9,
    TestLabel "Test Insert Number not in the Bag" test_insert_10,
    TestLabel "Test Insert Number not in the Bag" test_insert_11,
    TestLabel "Test Insert Number not in the Bag" test_insert_12,
    TestLabel "Test Insert Number not in the Bag" test_insert_13]
