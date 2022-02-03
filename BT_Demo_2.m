clc,clear 
p1=[1.24,1.27;1.36,1.74;1.38,1.64;1.38,1.82;1.38,1.90; 
 1.40,1.70;1.48,1.82;1.54,1.82;1.56,2.08]; 
p2=[1.14,1.82;1.18,1.96;1.20,1.86;1.26,2.00 
 1.28,2.00;1.30,1.96]; 
p=[p1;p2]'; 
goal=[ones(1,9),zeros(1,6)]; 
net2=newff(p,goal,[3,2],{'logsig','logsig'}); 
net2.trainParam.show = 10; 
net2.trainParam.lr = 0.05; 
net2.trainParam.goal = 1e-10; 
net2.trainParam.epochs =100 ;
%在新的newff语法体系中，需要清除net2.divideFcn等属性再训练，否则结果误差较大
net2.divideFcn ='';
net2 = train(net2,p,goal); 
x=[1.24 1.80;1.28 1.84;1.40 2.04]'; 
y0=sim(net2,p) %输入样本的预测
y=sim(net2,x)%对三组数据的预测