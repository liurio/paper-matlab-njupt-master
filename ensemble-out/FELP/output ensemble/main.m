clear all
data_clear
load wdbc.mat;%�������ݼ�
cm=10;%������֤����
e=[0.00000001,0.0000001,0.000001,0.00001,0.0001,0.001,0.01,0.1,1];%ѡȡ����˽��
e1=[0,0,0,0,0,0,0,0,0];%ѡȡ����˽��Ϊ0�ĵ�
s=[0,1,2,3,4,5,6,7,8];%ѡȡ����˽�ȸ����㣬һ��9��
K=20;%�Ӽ�����
f=floor(size(sample,2)*0.1);%ѡȡ����������
sn=size(e,2);%�����˽�ȸ���
[L_saccu_en_out,L_kaccu_en_out,L_saccu_non,L_kaccu_non,weights_en_out,weights_non] = corss( sample,f,cm,e,e1,K);
%L_saccu_en_out���ȼ��ɺ��������svm�����������L_kaccu_en_out���ȼ��ɺ��������knn�����������weights_en_out���ȼ��ɺ��������Ȩ��
%L_saccu_non��L_kaccu_nonΪ������������¼��ɵĽ����weights_non��������������¼��ɵ�Ȩ��
tu