import unittest
import app

class ApptestCase(unittest.TestCase):
    def testint5(self):
        resp = app.isneg(0)
        data = resp.get_json()
        self.assertEqual(data['msg'],"False")

    def testintnext5(self):
        resp = app.isneg(3)
        data = resp.get_json()
        self.assertEqual(data['msg'],"False")

    def testfloat35(self):
        resp = app.isneg('-5')
        data = resp.get_json()
        self.assertEqual(data['msg'],"True")

    def teststr(self):
        resp = app.isneg('a')
        data = resp.get_json()
        self.assertEqual(data['msg'],'error')

if __name__ == "__main__":
    unittest.main()