import unittest

def func(x):
    return x + 1

class TestFunc(unittest.TestCase):

    def test_answer(self):
        self.assertEqual(func(5), 6)

if __name__ == '__main__':
    unittest.main()
