function [saccu_ensemble,kaccu_ensemble,saccu,kaccu,saccu_no,kaccu_no] = getaccu(sample,train,test,e,f)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
%train:ѵ����
%fn:ѡ�������ά��
%�����saccu������svm�㷨��׼ȷ�ʣ�kaccu����knn�㷨�ķ���׼ȷ�ʣ��������3����

fprintf('this is getaccu!\n')
[m,n]=size(sample);
fd=size(train,2);
fd=fd-1;

ztrain=getZ(train);%��Ϊopsfz�㷨��Ҫ��ѵ�������б任������ȡz
fprintf('begin to obj.....\n')
R = gamrnd(0.001,2/(m*e*1.9),1,n-1);
K=20;
weights4=OPSFZ_EN(ztrain,R,K);%ͬʱ�����ͬ�㷨������ѡ����
[w_weight4,w_site4]=sort(weights4);%��Ȩ������
[saccu_ensemble,kaccu_ensemble]=SVM_KNN( train,test,w_site4,f );

weights41=OPSFZ(ztrain,R);%ͬʱ�����ͬ�㷨������ѡ����
[w_weight41,w_site41]=sort(weights41);%��Ȩ������
[saccu,kaccu]=SVM_KNN( train,test,w_site41,f );
fprintf('end to obj\n')

fprintf('begin to non.....\n')
weights44=OPSFZ(ztrain,0);
[w_weight,w_site44]=sort(weights44);%��Ȩ������
[saccu_no,kaccu_no]=SVM_KNN( train,test,w_site44,f );
fprintf('end to non\n')






