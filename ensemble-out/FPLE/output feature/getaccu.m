function [saccu_e111,kaccu_e111,saccu,kaccu,saccu_n,kaccu_n,weights_out_en,weights_en_out,weights_non] = getaccu( train,test,e,e1,f,k)
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

%%�ȼ������󼯳�
R=gamrnd(0.03,2/(m*0.9*e*0.4),1,p);
for l=1:k
    [w_weight3,w_site3]=sort(weight_e(l,:));%����Ȩ������
    [saccu3,kaccu3] =SVM_KNN( train,test,w_site3,f);%��������÷���׼ȷ��
    saccu_e(l,:)=saccu3;
    kaccu_e(l,:)=kaccu3;
end
weights_eeee=sum(weight_e)/k;%����
saccu_e111=sum(saccu_e)/k;
kaccu_e111=sum(kaccu_e)/k;
weights_out_en=weights_eeee;

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
