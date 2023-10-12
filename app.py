
from flask import Flask, jsonify

app = Flask(__name__)

app.app_context().push()

@app.route('/')
def index():
    return "Index!"

@app.route('/is_prime/<num1>', methods=['GET'])
def is_prime(num1):
    try:
        num1 = int(num1)
        if num1 > 1:
            for i in range(2, int(num1/2)+1):
                if (num1 % i) == 0:
                    results = { 'msg' : 'False' }
                    break
            else:
                results = { 'msg' : 'True' }

        else:
            results = { 'msg' : 'False' }

    except:
        results = { 'error_msg' : 'inputs must be numbers' }
    return jsonify(results)


if __name__ == '__main__':
    app.run()