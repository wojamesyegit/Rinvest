

# -*- coding: utf-8 -*-
"""
Created on Sun Aug  4 09:15:26 2019

@author: Mr. Wang
"""

import tushare as ts
import matplotlib as mpl
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from flask import Flask,jsonify,request
from io import BytesIO
import base64
app = Flask(__name__)#创建一个服务，赋值给APP
data = ts.get_stock_basics()
@app.route('/plot',methods=['get'])
#df_concept = ts.get_concept_classified()

#df_yun = df_concept.loc[df_concept['c_name'] == "云计算"]
#code_yun = df_yun['code']
#for c in code_yun:
#    df_t=ts.get_hist_data(c,start='2018-08-01',end='2019-07-31') 
#    df_t.to_csv('assets'+c +'.csv')

def test():
#    codes=[
#        (u'浪潮信息','000977'),(u'光环新网','300383'),(u'华胜天成','600410'),
#        (u'中科曙光','603019'),(u'中兴通讯','000063'),(u'浪潮软件','600756'),
#        (u'东方通','300379')
#    ]
    
    #获取输入数据
    

    #callback = request.args.get('callback')
    
    #初始化股票代码数组
    s1 = request.args.get('s1')
    s2 = request.args.get('s2')
    s3 = request.args.get('s3')
    s4 = request.args.get('s4')
    s5 = request.args.get('s5')
    s6 = request.args.get('s6')
    s7 = request.args.get('s7')
    s8 = request.args.get('s8')
    s9 = request.args.get('s9')
    s10 = request.args.get('s10')

    #callback = request.args.get('callback')
    
    #初始化股票代码数组
    codes_in=[
         '600999', '600048','','','','','','','',''
       
    ]
   
    #数组赋初值
    codes_in[0]  = s1
    codes_in[1]  = s2
    codes_in[2]  = s3
    codes_in[3]  = s4
    codes_in[4]  = s5
    codes_in[5]  = s6
    codes_in[6]  = s7
    codes_in[7]  = s8
    codes_in[8]  = s9
    codes_in[9]  = s10
    
   
    
    
    #清洗用户输入
    while ("" in codes_in):
        codes_in.remove("")
#    for c in codes_in:
#      if c == "":
#        print(c)
#        #codes_in.remove(index)
#        del codes_in[codes_in.index(c)]
    
    num = len(codes_in)
    #获取各股票行情数据
    
    
    #today = time.strftime("%Y-%m-%d", time.localtime())
    
    import datetime
    end_day = datetime.datetime.now().strftime("%Y-%m-%d")
    start_day = (datetime.datetime.now()+datetime.timedelta(days=-120)).strftime("%Y-%m-%d")
   
    
    for c in codes_in:
        df=ts.get_hist_data(c,start=start_day,end=end_day)
        df.to_csv('assets'+c+'.csv')
        
    day_len = len(df)
    # 输出到CSV
#    for c in codes:
#        df=ts.get_hist_data(c[1],start='2019-05-07',end='2019-05-18')
#        df.to_csv('assets'+c[0]+'.csv')
       
    
    #设置格式
#    stocks=[
#        (u'浪潮信息','000977'),(u'光环新网','300383'),(u'华胜天成','600410'),
#        (u'中科曙光','603019'),(u'中兴通讯','000063'),(u'浪潮软件','600756'),
#        (u'东方通','300379')
#    ]
#    
#    
    
    #创建字典，key值是股票名称
    codes={} #创建字典
    for s in codes_in:
        
        codes[s]=data.loc[s, 'name']
      
    symbols=codes.keys() #所有股票名称作为key值
    
    def col_converter(x): #定义转换函数
        try:
            return float(x)
        except:
            return None
    
    prices=None
    
    for i,s in enumerate(symbols): #穷举每一个股票名称
        
        p=pd.read_csv('assets'+s.upper()+'.csv',
     usecols=['close','date'],index_col='date',
     converters={'close':col_converter}, engine='python')#engine = 'python' 不然打不开文件
        if i==0:
            prices=pd.DataFrame(index=p.index)#创建dataframe
        prices[s]=p['close'] #初始化每一列
    
    prices.sort_index(ascending=True,inplace=True) #升序排列
    prices.dropna(inplace=True) #去掉空值

    co=prices.pct_change().corr()#相关系数dataframe
    for symbol in symbols:
        v=co[symbol].sort_values() #按相关系数升序
        print (symbol,u' | 正相关度最高: ',v.index[-2],u' 相关系数=',v[-2],u'   | 负相关度最高: ',v.index[0],u' 相关系数=',v[0])
        print ('')
    
    #将股票分为   
    from sklearn.cluster import affinity_propagation
    _,labels=affinity_propagation(co)
    symbolx = list(symbols)#须转换为list
    df_c=pd.DataFrame({'label':labels,'name':symbolx})
    g=df_c.groupby('label')
    for item in g:
        x = item[1]['name'].values
        print (item[0],','.join(x))
        print ('=============')
#    prices.pct_change().hist(column=[u'浪潮信息',u'光环新网',u'华胜天成',u'中兴通讯' , u'东方通', u'浪潮软件', u'中科曙光'],
#                     sharex=True,sharey=True,bins=30)
#    

    weights = np.random.random(num)
    
    weights /= np.sum(weights)
    
    weights
    
    log_returns = np.log(prices.pct_change()+1)
    
    log_returns = log_returns.dropna()
    
    #投资组合的风险（9个交易日，标准差）
    np.sqrt(np.dot(weights, np.dot(log_returns.cov()* day_len, weights)))#九个交易日
    
    
    #随机生成1000种随机的投资组合，即权重weight的尺寸为1000*9
    port_returns = []
    port_variance = []
    for p in range(1000):
      weights = np.random.random(num)
      weights /=np.sum(weights)
      port_returns.append(np.sum(log_returns.mean()* day_len*weights))
      port_variance.append(np.sqrt(np.dot(weights.T, np.dot(log_returns.cov()* day_len, weights))))
    port_returns = np.array(port_returns)
    port_variance = np.array(port_variance)
    #无风险利率设定为3 
    risk_free = 0.03 
   
    
    #优化，夏普率最大
    import scipy.optimize as sco
    def stats(weights):
          weights = np.array(weights)
          port_returns = np.sum(log_returns.mean()*weights)* day_len
          port_variance = np.sqrt(np.dot(weights.T,np.dot(log_returns.cov()*day_len,weights)))
          return np.array([port_returns,port_variance,port_returns/port_variance])
      
    def min_sharpe(weights):
    
       return-stats(weights)[2]
    #给定初始权重
    #权重（某股票持仓比例）限制在0和1之间。
    x0 =num*[1./num]
    bnds = tuple((0,1) for  x in range(num))
    #权重（股票持仓比例）的总和为1。
    cons = ({'type':'eq','fun':lambda x: np.sum(x)-1})
    #优化函数调用中忽略的唯一输入是起始参数列表(对权重的初始猜测)。我们简单的使用平均分布。
    opts = sco.minimize(min_sharpe,x0,method ='SLSQP',bounds = bnds,constraints = cons)
    opts
    
    output = (opts['x'].round(3)).tolist()
    my_dict = {}
    for s in codes_in:
        
        my_dict[data.loc[s, 'name']] = output[codes_in.index(s)] 
    
    
    #sharpe最大的组合3个统计数据分别为：
    stats(opts['x']).round(3)
    
    def min_variance(weights):
      return stats(weights)[1]
    
    optv = sco.minimize(min_variance,
    
    x0,
    
    method ='SLSQP',
    
    bounds = bnds,
    
    constraints = cons)
    
    optv
    
    optv['x'].round(3)
    #得到的投资组合预期收益率、波动率和夏普指数
    stats(optv['x']).round(3)
    
    
    #定义一个函数对方差进行最小化
    def min_variance(weights):
        return stats(weights)[1]
    
    
    target_returns = np.linspace(0.0,0.5,50)
    target_variance = []
    for tar in target_returns:
        cons = ({'type':'eq','fun':lambda x:stats(x)[0]-tar},
        {'type':'eq','fun':lambda x:np.sum(x)-1})
        res = sco.minimize(min_variance,x0,method ='SLSQP', bounds = bnds,constraints = cons)
        target_variance.append(res['fun'])
        
    target_variance = np.array(target_variance)
     #下面是最优化结果的展示。叉号：构成的曲线是有效前沿（目标收益率下最优的投资组合）
     #红星：sharpe最大的投资组合黄星：方差最小的投资组合
    plt.figure(figsize = (8,4))
     #圆点：随机生成的投资组合散布的点
    plt.scatter(port_variance, port_returns, c = port_returns/port_variance,marker ='o')
     #叉号：投资组合有效边界
    plt.scatter(target_variance,target_returns,c = target_returns/target_variance,marker ='x')
     #红星：标记夏普率最大的组合点plt.plot
    plt.plot(stats(opts['x'])[1],stats(opts['x'])[0],'r*',markersize =15.0)
     #黄星：标记方差最小投资组合点
    plt.plot(stats(optv['x'])[1], stats(optv['x'])[0],'y*', markersize =15.0)
    plt.grid(True)
    plt.xlabel('expected volatility')
    plt.ylabel('expected return')
    plt.colorbar(label ='Sharpe ratio')
     
    sio = BytesIO()
    plt.savefig(sio, format='png')
    data_plot = base64.encodebytes(sio.getvalue()).decode()
    print(data_plot)
    html = '''
       <html>
           <body>
               <img src="data:image/png;base64,{}" />
               <p> {}  </p>
           </body>
        <html>
    '''
    plt.close()
    return html.format(data_plot, my_dict)
app.run(host='0.0.0.0',port=8807,debug=True)
#df_concept = ts.get_concept_classified()
#
#df_yun = df_concept.loc[df_concept['c_name'] == "云计算"]

#df_bigdata = []
#for i in df_concept['name']:
#     if (df_concept[i.index]['c_name'].value == '云计算'):
#         df_bigdata.append(i)

#ma20 = ts.get_hist_data('002093', start='2016-01-05',end='2016-02-09') #获取周k线数据
print(test())