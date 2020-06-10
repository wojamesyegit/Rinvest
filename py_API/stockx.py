# -*- coding: utf-8 -*-
"""
Created on Wed Jun  3 10:06:30 2020

@author: DELL
"""

# -*- coding: utf-8 -*-
"""
Created on Sun Aug  4 09:15:26 2019

@author: Mr. Wang
"""
token = '1144ffff3b05f85807f4403b8f8ccf4ecccddf233f6013e77af0ed47'
import tushare as ts
import matplotlib as mpl
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from flask import Flask,jsonify,request
import json
import time
app = Flask(__name__)#创建一个服务，赋值给APP
data = ts.get_stock_basics()
@app.route('/stockx',methods=['get'])
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
    s_or_v =  request.args.get('s_or_v')
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
         '', '','','','','','','','',''
       
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
    
    num = len(codes_in)
   
    
    import datetime
    end_day = datetime.datetime.now().strftime("%Y-%m-%d")
    start_day = (datetime.datetime.now()+datetime.timedelta(days=-300)).strftime("%Y-%m-%d")
   
    
    for c in codes_in:
        df=ts.get_hist_data(c,start=start_day,end=end_day)
        df.to_csv('assets'+c+'.csv')
        
    day_len = len(df)

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


    weights = np.random.random(num)
    
    weights /= np.sum(weights)
    
    #weights
    
    
    ##回报率
    log_returns = np.log(prices.pct_change()+1)
    
    log_returns = log_returns.dropna()
    
    #投资组合的风险（9个交易日，标准差）
    np.sqrt(np.dot(weights, np.dot(log_returns.cov()* day_len, weights)))#九个交易日
    
    
    #随机生成1000种随机的投资组合，即权重weight的尺寸为1000*9
    port_returns = []
    port_variance = []
    #都使用矩阵运算 
    for p in range(1000):
      weights = np.random.random(num)
      weights /=np.sum(weights)
      port_returns.append(np.sum(log_returns.mean()* day_len*weights))
      port_variance.append(np.sqrt(np.dot(weights.T, np.dot(log_returns.cov()* day_len, weights))))
    port_returns = np.array(port_returns)
    port_variance = np.array(port_variance)
    #无风险利率设定为3 
    #risk_free = 0.03 
   
    #最优化投资组合的推导是一个约束最优化问题，优化使夏普率最大
    #这里直接调用scipy包的优化函数进行CSP问题求解，
    
    import scipy.optimize as sco
    def stats(weights):
          weights = np.array(weights)
          port_returns = np.sum(log_returns.mean()*weights)* day_len
          port_variance = np.sqrt(np.dot(weights.T,np.dot(log_returns.cov()*day_len,weights)))
          return np.array([port_returns,port_variance,port_returns/port_variance])
      
      
    
    #最大化夏普率，也就是最小化夏普率的负值
    def min_sharpe(weights):
    
       return-stats(weights)[2]
       
       
    #设定初始权重，每只股票权重平均分布，initial state
    x0 =num*[1./num]
    
    #参数值（权重）限制在0和l之间。这些值以多个元组组成的一个元组形式提供给最小化函数：
    bnds = tuple((0,1) for  x in range(num))
    #constraint, 权重（股票持仓比例）的总和为1
    cons = ({'type':'eq','fun':lambda x: np.sum(x)-1})
    
    #优化函数调用中起始参数列表设为初始权重x0，并将其他约束当作参数传入
    #SLSQP:Sequential Least Squares Programming optimization algorithm
    opts = sco.minimize(min_sharpe,x0,method ='SLSQP',bounds = bnds,constraints = cons)
    #opts
    
    output = (opts['x'].round(3)).tolist()
    my_dict = {'name' :[],'weight':[], 'res':[]}
    for s in codes_in:
        my_dict['name'].append(data.loc[s, 'name'])
        my_dict['weight'].append(output[codes_in.index(s)] )
    #sharpe最大的组合3个统计数据分别为：
    a = stats(opts['x']).round(3)
    my_dict['res'].append(a[0])
    my_dict['res'].append(a[1])
    my_dict['res'].append(a[2])
   
     #定义一个函数对方差进行最小化
    def min_variance(weights):
      return stats(weights)[1]
     
   
    optv = sco.minimize(min_variance,
    
    x0,
    
    method ='SLSQP',
    
    bounds = bnds,
    
    constraints = cons)
    
    #optv
    
    bestv = optv['x'].round(3)
    #得到的投资组合预期收益率、波动率和夏普指数
    res_bestv = stats(optv['x']).round(3)
    output2 = (optv['x'].round(3)).tolist()
    my_dict2 = {'name' :[],'weight':[], 'res':[]}
    for s in codes_in:
        my_dict2['name'].append(data.loc[s, 'name'])
        my_dict2['weight'].append(output2[codes_in.index(s)] )
    #sharpe最大的组合3个统计数据分别为：
    b = stats(optv['x']).round(3)
    my_dict2['res'].append(b[0])
    my_dict2['res'].append(b[1])
    my_dict2['res'].append(b[2])
    
  
    
# 在使用flask框架编写API时处理图像输出时遇到了一些问题，暂时没有上线优化过程的可视化输出
#    target_returns = np.linspace(0.0,0.5,50)
#    target_variance = []
#    for tar in target_returns:
#        cons = ({'type':'eq','fun':lambda x:stats(x)[0]-tar},
#        {'type':'eq','fun':lambda x:np.sum(x)-1})
#        res = sco.minimize(min_variance,x0,method ='SLSQP', bounds = bnds,constraints = cons)
#        target_variance.append(res['fun'])
#        
#    target_variance = np.array(target_variance)
#     #下面是最优化结果的展示。叉号：构成的曲线是有效前沿（目标收益率下最优的投资组合）
#     #红星：sharpe最大的投资组合黄星：方差最小的投资组合
#    plt.figure(figsize = (8,4))
#     #圆点：随机生成的投资组合散布的点
#    plt.scatter(port_variance, port_returns, c = port_returns/port_variance,marker ='o')
#     #叉号：投资组合有效边界
#    plt.scatter(target_variance,target_returns,c = target_returns/target_variance,marker ='x')
#     #红星：标记夏普率最大的组合点plt.plot
#    plt.plot(stats(opts['x'])[1],stats(opts['x'])[0],'r*',markersize =15.0)
#     #黄星：标记方差最小投资组合点
#    plt.plot(stats(optv['x'])[1], stats(optv['x'])[0],'y*', markersize =15.0)
#    plt.grid(True)
#    plt.xlabel('expected volatility')
#    plt.ylabel('expected return')
#    plt.colorbar(label ='Sharpe ratio')
    if s_or_v == "v":
        return "raybu("+json.dumps(my_dict2) +");"
    else:
        return "raybu("+json.dumps(my_dict) +");"
    
app.run(host='0.0.0.0',port=8812,debug=True)

