function [saccu,kaccu,saccu_n,kaccu_n,weights_en_out,weights_non] = getaccu( train,test,e,e1,f,k)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
%train:ѵ����
%fn:ѡ�������ά��
%�����saccu������svm�㷨��׼ȷ�ʣ�kaccu����knn�㷨�ķ���׼ȷ�ʣ��������3����
[m,p]=size(train);%��ȡѵ����������������ά��
p=p-1;%��ȡѵ������������
for s=1:k%�õ�s������������������Ϊ0.9*m
    subrank=randperm(m);%�������1��m֮�����������
    subsam=train(subrank,:);%�õ��������к������
    subsam=subsam(1:floor(0.9*m),:);%ѡ��ǰ90%������
    z=getZ(subsam);%��û��ھֲ�ѧϰ������Ȩ���㷨�Ĳ���z
    weights4=OPSFZ(z);%���ھֲ�ѧϰ������Ȩ���㷨
    weight(s,:)=weights4;
end

%%�ȼ��ɺ������
ss=size(e,2);
for t=1:ss
     H(t,:)=gamrnd(0.1,2/(m*0.9*e(t)*0.4),1,p);%�����������
end
weights=sum(weight)/k;%�ȼ���
weights1=weights;
fs=size(e,2);
for j=1:fs
    weights_e=weights1+H(j,:);%������
    [w_weight4,w_site4]=sort(weights_e);
    [saccu1,kaccu1] =SVM_KNN( train,test,w_site4,f);%��������÷���׼ȷ��
    saccu(j,:)=saccu1;
    kaccu(j,:)=kaccu1;
    weights_e1(:,j)=weights_e;
end
weights_en_out=weights_e1;

%%��������   
fs_1=size(e1,2);
for k=1:fs_1
    [w_weight5,w_site5]=sort(weights1);%�Բ��������ļ��ɽ������
    [saccu2,kaccu2] =SVM_KNN( train,test,w_site5,f);%��������÷���׼ȷ��
    saccu_n(k,:)=saccu2;
    kaccu_n(k,:)=kaccu2;
    weights_e2(:,k)=weights1;
end
weights_non=weights_e2;

