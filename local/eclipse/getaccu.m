function [saccu_local,kaccu_local,saccu_out,kaccu_out,saccu_no,kaccu_no] = getaccu(sample,train,test,e,f)
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
R = gamrnd(0.001,2/(m*e*1.9),1,n-1);

fprintf('begin to out.....\n')
weights44=OPSFZ(ztrain);
weights4_out=weights44+R;
[w_weight44,w_site44]=sort(weights4_out);%��Ȩ������
[saccu_out,kaccu_out]=SVM_KNN( train,test,w_site44,f );
fprintf('end to out\n')

fprintf('begin to non.....\n')
weights444=OPSFZ(ztrain);
[w_weight444,w_site444]=sort(weights444);%��Ȩ������
[saccu_no,kaccu_no]=SVM_KNN( train,test,w_site444,f );
fprintf('end to non\n')

fprintf('begin to non.....\n')
weights4444=OPSFZ_local(ztrain,e);
[w_weight4444,w_site4444]=sort(weights4444);%��Ȩ������
[saccu_local,kaccu_local]=SVM_KNN( train,test,w_site4444,f );
fprintf('end to non\n')





