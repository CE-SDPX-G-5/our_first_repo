import unittest
import app

class AppTestCase(unittest.TestCase):
    def test_7(self):
        res = app.next2('5')
        data = res.get_json()
        self.assertEqual(data['mrg'], 7)

    def test_8(self):
        res = app.next2('6')
        data = res.get_json()
        self.assertEqual(data['mrg'], 8)

    def test_8(self):
        res = app.next2('3.5')
        data = res.get_json()
        self.assertEqual(data['mrg'], 5.5)

    def test_8(self):
        res = app.next2('a')
        data = res.get_json()
        self.assertEqual(data['mrg'], 'Error')

if __name__ == "__main__":
    unittest.main()