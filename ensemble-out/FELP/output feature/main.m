clear all
data_clear
load ionosphere.mat;%�������ݼ�
cm=10;%������֤����
e=0.01;%ѡȡ����˽��
e1=0;%ѡȡ����˽��Ϊ0�ĵ�
K=20;%�Ӽ�����
%f=[1,8,15,22,30];%ѡȡ����������
%f=[1,9,17,25,35];
%f=[1,2,3,4,5];
%f=[1,1215,2430,3645,4860];
%f=[1,12,23,34,44];
%f=[1,900,2480,3600,4960,6400,7440,8300,9920];
f=[1,4,7,9,13];
%f=[1,100,214,300,428,642,856];
%f=[1,3,5,7,9];
%f=[1,15,30,45,60];
%f=[1,25,50,75,100];
[L_saccu_en_out,L_kaccu_en_out,L_saccu_non,L_kaccu_non,weights_en_out,weights_non]= corss( sample,f,cm,e,e1,K);%���ɷ���׼ȷ�ʽ����L_saccu���ȼ��ɺ��������svm�����������L_kaccu���ȼ��ɺ��������knn�����������L_saccu4n��L_kaccu4nΪ������������¼��ɵĽ��
tu