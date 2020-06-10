
import tushare as ts
import pandas as pd
import json
from flask import Flask,jsonify,request
app = Flask(__name__)#创建一个服务，赋值给APP
data = ts.get_stock_basics()
def to_json2(df,orient='split'):
    df_json = df.to_json(orient = orient, force_ascii = False)
    return json.loads(df_json)
@app.route('/info',methods=['get'])


def name():
    s = request.args.get('s')
    #name = data.loc[s, 'name']
    info = data.loc[s, ]
    #callback = request.args.get('callback')
    my_dict= to_json2(info)
    return "raybu("+json.dumps(my_dict) +");"
app.run(host='0.0.0.0',port=8811,debug=True)


