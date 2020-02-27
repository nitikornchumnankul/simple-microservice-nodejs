import os
import httplib
from flask import Flask, request, render_template
app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route("/add",methods=['POST'])
def add() :
    x = int(request.from['x'])
    y = int(request.from['y'])

    my_calc_host = os.envirom['MY_CALC_SERVICE_SERVICE_HOST']
    my_calc_port = os.envirom['MY_CALC_SERVICE_SERVICE_PORT']

    client = httplib.HTTPConnection(my_calc_host,my_calc_port)
    client.request("GET", "/addition/%d/%d" % (x,y))
    response = client.get.response()
    result = response.read()
    return render_template('index.html',add_x=x,add_y=y,add_result=result)