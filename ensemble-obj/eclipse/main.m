clear all
data_clear
load arcene.mat;%�������ݼ�
cm=10;%������֤����
e=[0.00000001,0.0000001,0.000001,0.00001,0.0001,0.001,0.01,0.1,1];%ѡȡ����˽��
e1=[0,0,0,0,0,0,0,0,0];%ѡȡ����˽��Ϊ0�ĵ�
s=[0,1,2,3,4,5,6,7,8];%ѡȡ����˽�ȸ����㣬һ��9��
f=floor(size(sample,2)*0.1);%ѡȡ����������
[result_saccu_ensemble,result_kaccu_ensemble,result_saccu,result_kaccu,result_saccu_no,result_kaccu_no] = corss( sample,f,cm,e);
knn_tu