clear;clc;
P=[-1 -1 2 2 4;0 5 0 5 7];
T=[-1 -1 1 1 -1];
%minmax���������뷶Χ
net = newff(minmax(P),[5,1],{'tansig','purelin'},'trainrp');
net.trainParam.show = 50 ;%��ʾѵ����������,50�����ں���ʾһ���������ߵı仯
net.trainParam.lr=0.05;%ѧϰ��
net.trainParam.epochs=300;%ѵ������
net.trainParam.goal=1e-5;%ѵ������
[net,tr]=train(net,P,T);%����ѵ��
W1 = net.iw{1,1} %���뵽�м��Ȩֵ
B1 = net.b{1}  %���뵽�м����ֵ
W2 = net.lw{2,1} %�м�㵽�����Ȩֵ
B2 = net.b{2} %�м�㵽�������ֵ
X = sim(net,P) %����
figure(1);
plot(X,'b') %Ԥ��
hold on
plot(T,'*')%ʵ��


net2 = newff(P,T,5,{'tansig','purelin'},'trainrp');
net2.trainParam.show = 50 ;%��ʾѵ����������,50�����ں���ʾһ���������ߵı仯
net2.trainParam.lr=0.05;%ѧϰ��
net2.trainParam.epochs=300;%ѵ������
net2.trainParam.goal=1e-5;%ѵ������
net2.divideFcn = '';      % Ϊ���鱾һ�£������������ٵ��������Ҫ��������
[net2,tr]=train(net2,P,T);%����ѵ��
W2_1 = net2.iw{1,1} %���뵽�м��Ȩֵ
B2_1 = net2.b{1}  %���뵽�м����ֵ
W2_2 = net2.lw{2,1} %�м�㵽�����Ȩֵ
B2_2 = net2.b{2} %�м�㵽�������ֵ
X2 = sim(net2,P) %����
figure(2);
plot(X2,'b') %Ԥ��
hold on
plot(T,'*')%ʵ��