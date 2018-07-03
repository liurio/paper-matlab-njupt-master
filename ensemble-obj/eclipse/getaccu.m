function [saccu_ensemble,kaccu_ensemble,saccu,kaccu,saccu_no,kaccu_no] = getaccu(sample,train,test,e,f)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
%train:训练集
%fn:选择的特征维数
%输出：saccu：采用svm算法的准确率，kaccu采用knn算法的分类准确率，这里采用3近邻

fprintf('this is getaccu!\n')
[m,n]=size(sample);
fd=size(train,2);
fd=fd-1;

ztrain=getZ(train);%因为opsfz算法需要对训练集进行变换，即求取z
fprintf('begin to obj.....\n')
R = gamrnd(0.001,2/(m*e*1.9),1,n-1);
K=20;
weights4=OPSFZ_EN(ztrain,R,K);%同时求出不同算法的特征选择结果
[w_weight4,w_site4]=sort(weights4);%对权重排序
[saccu_ensemble,kaccu_ensemble]=SVM_KNN( train,test,w_site4,f );

weights41=OPSFZ(ztrain,R);%同时求出不同算法的特征选择结果
[w_weight41,w_site41]=sort(weights41);%对权重排序
[saccu,kaccu]=SVM_KNN( train,test,w_site41,f );
fprintf('end to obj\n')

fprintf('begin to non.....\n')
weights44=OPSFZ(ztrain,0);
[w_weight,w_site44]=sort(weights44);%对权重排序
[saccu_no,kaccu_no]=SVM_KNN( train,test,w_site44,f );
fprintf('end to non\n')






