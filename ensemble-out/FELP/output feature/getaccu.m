function [saccu,kaccu,saccu_n,kaccu_n,weights_en_out,weights_non] = getaccu( train,test,e,e1,f,k)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
%train:ѵ����
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
weights=sum(weight)/k;%�ȼ���
weights_e=weights+R;%������
[w_weight4,w_site4]=sort(weights_e);
[saccu,kaccu] =SVM_KNN( train,test,w_site4,f);%��������÷���׼ȷ��
weights_en_out=weights_e;

%%��������   
[w_weight5,w_site5]=sort(weights);%�Բ��������ļ��ɽ������
[saccu_n,kaccu_n] =SVM_KNN( train,test,w_site5,f);%��������÷���׼ȷ��
weights_non=weights;

