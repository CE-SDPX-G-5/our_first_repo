from flask import Flask,jsonify


app = Flask (__name__)

app.app_context().push()

@app.route('/')
def index():
    return 'Welcome'

@app.route('/isneg/<i>',methods=['GET'])
def isneg(i):

    try:
        try:
            i = int(i)
            if i < 0 :
                resp = { 'msg' : ("True") }
            elif i >= 0 :
                resp = { 'msg' : ("False") }
        except:
            i = float(i)    
            if i >= 0 :
                resp = { 'msg' : ("True 2") }
            elif i >= 0 :
                resp = { 'msg' : ("False 2") }      
                
    except ValueError:
        try:
            i = float(i)
            resp = { 'msg' : (i+2) }
        except:
            i = str(i)
            resp = { 'msg' : 'error' }
     
    return jsonify(resp)   

if __name__ == "__main__":
    app.run()