from flask import Flask,jsonify

app = Flask(__name__)

app.app_context().push()

@app.route('/')
def index():
    return "Hello Wrold"

@app.route('/next2/<x>',methods=['GET'])
def next2(x):
    try:
        x = int(x)
        res = {'mrg': x+2}
    except ValueError:
        try:
            x = float(x)
            res = {'mrg': x+2}
        except:
            res = {'mrg': 'Error'}
    return jsonify(res)

if __name__=="__main__":
    app.run()