import unittest
import app 

class AppTestCase(unittest.TestCase):
    def test_is_prime_number17(self):
        res = app.is_prime(17)
        data = res.get_json()
        self.assertEqual(data['msg'], 'True')

    def test_is_prime_number36(self):
        res = app.is_prime(36)
        data = res.get_json()
        self.assertEqual(data['msg'], 'False')

if __name__ == "__main__":
    unittest.main()