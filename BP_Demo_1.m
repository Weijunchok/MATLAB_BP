clear;clc;
P=[-1 -1 2 2 4;0 5 0 5 7];
T=[-1 -1 1 1 -1];
%minmax求样本输入范围
net = newff(minmax(P),[5,1],{'tansig','purelin'},'trainrp');
net.trainParam.show = 50 ;%显示训练迭代过程,50个周期后显示一下收敛曲线的变化
net.trainParam.lr=0.05;%学习率
net.trainParam.epochs=300;%训练轮数
net.trainParam.goal=1e-5;%训练精度
[net,tr]=train(net,P,T);%网络训练
W1 = net.iw{1,1} %输入到中间层权值
B1 = net.b{1}  %输入到中间层阈值
W2 = net.lw{2,1} %中间层到输出层权值
B2 = net.b{2} %中间层到输出层阈值
X = sim(net,P) %仿真
figure(1);
plot(X,'b') %预测
hold on
plot(T,'*')%实际


net2 = newff(P,T,5,{'tansig','purelin'},'trainrp');
net2.trainParam.show = 50 ;%显示训练迭代过程,50个周期后显示一下收敛曲线的变化
net2.trainParam.lr=0.05;%学习率
net2.trainParam.epochs=300;%训练轮数
net2.trainParam.goal=1e-5;%训练精度
net2.divideFcn = '';      % 为和书本一致，对于样本极少的情况，不要再三分了
[net2,tr]=train(net2,P,T);%网络训练
W2_1 = net2.iw{1,1} %输入到中间层权值
B2_1 = net2.b{1}  %输入到中间层阈值
W2_2 = net2.lw{2,1} %中间层到输出层权值
B2_2 = net2.b{2} %中间层到输出层阈值
X2 = sim(net2,P) %仿真
figure(2);
plot(X2,'b') %预测
hold on
plot(T,'*')%实际