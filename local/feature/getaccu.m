function [saccu_local,kaccu_local,saccu_out,kaccu_out,saccu_no,kaccu_no] = getaccu(sample,train,test,e,f)
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

R = gamrnd(0.001,2/(m*e*1.9),1,n-1);
fprintf('begin to local.....\n')
weights4=OPSFZ_local(ztrain,e);%同时求出不同算法的特征选择结果
[w_weight4,w_site4]=sort(weights4);%对权重排序
[saccu_local,kaccu_local]=SVM_KNN( train,test,w_site4,f );
fprintf('end to local\n')


fprintf('begin to out.....\n')
weights44=OPSFZ(ztrain);
weights4_out=weights44+R;
[w_weight,w_site44]=sort(weights4_out);%对权重排序
[saccu_out,kaccu_out]=SVM_KNN( train,test,w_site44,f );
fprintf('end to out\n')

fprintf('begin to non.....\n')
weights44=OPSFZ(ztrain);
[w_weight,w_site44]=sort(weights44);%对权重排序
[saccu_no,kaccu_no]=SVM_KNN( train,test,w_site44,f );
fprintf('end to non\n')





