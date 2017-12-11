import Test.HUnit
-- TODO importar projeto
-- TODO checar se tao funfando

test_insert_1 = TestCase (assertEqual "Should be able to Insert element in empty Bag" 
        (insert (1, 1) []) [(1, 1)])
test_insert_2 = TestCase (assertEqual "Should be able to Insert element already in Bag" 
        (insert (1, 1) [(1, 1)]) [(1, 2)])
test_insert_3 = TestCase (assertEqual "Should be able to Insert different type of element in Bag" 
        (insert ("a", 1) [(1, 1)]) [(1, 1), ("a", 1)])
test_insert_4 = TestCase (assertEqual "Should be able to Insert different type of element in Bag" 
        (insert ([], 1) [(1, 1)]) [(1, 1), ([], 1)])
test_insert_5 = TestCase (assertEqual "Should be able to Insert different type of element in Bag" 
        (insert ((6,6), 1) [(1, 1)]) [(1, 1), ((6,6), 1)])
test_insert_6 = TestCase (assertEqual "Should be able to chain Inserts" 
        (insert ("a", 1) (insert ([], 1) [(1, 1)])) [(1, 1), ([], 1), ("a", 1)])
test_insert_7 = TestCase (assertEqual "Should be able to chain Inserts" 
        (insert (1, 1) (insert ("a", 1) [(1, 1)])) [(1, 2), ("a", 1)])
test_insert_8 = TestCase (assertEqual "Should be able to chain Inserts" 
        (insert (1, 1) (insert (1, 1) [(1, 1)])) [(1, 3)])

test_remove_1 = TestCase (assertEqual "Removing any element from empty Bag should return empty Bag")
        (remove (1, 1) []) [])
test_remove_2 = TestCase (assertEquals "Removing element not in the Bag should return the same Bag"
        (remove ("a", 1) [(1, 1)]) [(1, 1)])
test_remove_3 = TestCase (assertEquals "Removing element already in the Bag should return the Bag decremeting one quantity of it"
        (remove (1, 1) [(1, 2)]) [(1, 1)])
test_remove_4 = TestCase (assertEquals "Removing element already in the Bag should return the Bag decremeting one quantity of it"
        (remove (1, 1) [(1, 1)]) [])
test_remove_5 = TestCase (assertEquals "Should be able to chain Removes"
        (remove ("a", 1) (remove (1, 1) [])) [])
test_remove_6 = TestCase (assertEquals "Should be able to chain Removes"
        (remove (1, 1) (remove (1, 1) [(1, 3)]) [1, 1])
test_remove_7 = TestCase (assertEquals "Should be able to chain Removes"
        (remove ("a", 1) (remove (1, 1) [(1, 3)]) [1, 2])
test_remove_8 = TestCase (assertEquals "Should be able to chain Removes"
        (remove (1, 1) (remove (1, 1) [(1, 2)]) [])

test_search_1 = TestCase (assertEquals "Searching for an element in a empty Bag should return 0"
        (search (1, 1) []) 0)
test_search_2 = TestCase (assertEquals "Searching for an element not in the Bag should return 0"
        (search ("a", 1) [(1, 1)]) 0)
test_search_3 = TestCase (assertEquals "Searching for an element in the Bag should return the right quantity"
        (search (1, 1) [(1, 1)]) 1)
test_search_4 = TestCase (assertEquals "Searching for an element in the Bag should return the right quantity"
        (search ("a", 1) [(1, 1), ("a", 1)]) 1)
test_search_4 = TestCase (assertEquals "Searching for an element in the Bag should return the right quantity"
(search ("a", 1) [(1, 1), ("a", 1)]) 1)
