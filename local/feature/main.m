clear all
data_clear
load arcene.mat;%�������ݼ�
cm=10;%������֤����
e=0.01;%ѡȡ����˽��
s=[0,1,2,3,4,5,6,7,8];%ѡȡ����˽�ȸ����㣬һ��9��
%f=[1,9,17,27,35];%soybean
f=[1,900,2840,4960,6400,8300,9920];
sn=size(f,2);%�����˽�ȸ���
[result_saccu_local,result_kaccu_local,result_saccu_out,result_kaccu_out,result_saccu_no,result_kaccu_no] = corss( sample,f,cm,e);
%[result_saccu,result_kaccu] = corss( sample,f,cm,e);

knn_tu