function [result_saccu_ensemble,result_kaccu_ensemble,result_saccu,result_kaccu,result_saccu_no,result_kaccu_no] = corss( sample,f,cross_num,e)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
%sample:ԭʼ���ݼ�
%cm:������֤������ʵ�����10�ν�����֤
%f:ѡ��Ĳ�ͬ����ά���������ݼ�����.

fprintf('this is corss!\n')
[m,n]=size(sample);%��ȡ���ݼ�������������������
fs=size(f,2);%�����ĸ���
subsam_num=floor(m/cross_num);%ÿ�ν�����֤���ֵ��Ӽ�������
for i=1:cross_num
    sam{i}=sample((i-1)*subsam_num+1:i*subsam_num,:);%�������Ӽ�����10�ȷ�
end
com=[2 3 4 5 6 7 8 9 10;1 3 4 5 6 7 8 9 10;1 2 3 5 6 7 8 9 10;1 2 4 5 6 7 8 9 10;1 2 3 4 6 7 8 9 10;1 2 3 4 5 7 8 9 10; 1 2 3 4 5 6 8 9 10;1 2 3 4 5 6 7 9 10;1 2 3 4 5 6 7 8 10;1 2 3 4 5 6 7 8 9];
for i=1:cross_num%���н�����֤
    fprintf('\n')
    fprintf('begin to �� %i �ν�����֤\n', i)
    test=sam{i};%ѡ��10�ȷ��еĵ�i����Ϊ���Լ�
    train=[sam{com(i,1)};sam{com(i,2)};sam{com(i,3)};sam{com(i,4)};sam{com(i,5)};sam{com(i,6)};sam{com(i,7)};sam{com(i,8)};sam{com(i,9)}];%ѡ��10�ȷ��е������ȷ���Ϊѵ����   
    for j=1:fs       
         fprintf('begin �� %i �ν�����֤, �� %j ����˽��.   f(j)=%j\n', i,j,f(j))
         %[saccu4,kaccu4,weights] =getsinaccu( train,test,e(j),f);%����ѡ������˽�Ƚ��з���׼ȷ��ʵ��
         [saccu_ensemble,kaccu_ensemble,saccu4,kaccu4,saccu_no4,kaccu_no4] =getaccu(sample, train,test,e,f(j));%���з���׼ȷ��ʵ��
         saccu_ensemble1(j,:)=saccu_ensemble;
         kaccu_ensemble1(j,:)=kaccu_ensemble;
         saccu1(j,:)=saccu4;
         kaccu1(j,:)=kaccu4;
         saccu_no1(j,:)=saccu_no4;
         kaccu_no1(j,:)=kaccu_no4;
         fprintf('end �� %i �ν�����֤, �� %j ����˽��\n', i,j)
         fprintf('\n')
    end
    saccuracy_ensemble{i}=saccu_ensemble1;
    kaccuracy_ensemble{i}=kaccu_ensemble1;
    saccuracy{i}=saccu1;
    kaccuracy{i}=kaccu1;
    saccuracy_no{i}=saccu_no1;
    kaccuracy_no{i}=kaccu_no1;
    fprintf('end begin to �� %i �ν�����֤\n', i)
    fprintf('\n')
end
result_saccu_ensemble=0;
result_kaccu_ensemble=0;
result_saccu=0;
result_kaccu=0;
result_saccu_no=0;
result_kaccu_no=0;
%%��10�ν�����֤ȡƽ��
for i=1:cross_num
    result_saccu_ensemble=result_saccu_ensemble+saccuracy_ensemble{i};
    result_kaccu_ensemble=result_kaccu_ensemble+kaccuracy_ensemble{i}; 
    result_saccu=result_saccu+saccuracy{i};
    result_kaccu=result_kaccu+kaccuracy{i};  
    result_saccu_no=result_saccu_no+saccuracy_no{i};
    result_kaccu_no=result_kaccu_no+kaccuracy_no{i}; 
end
result_saccu_ensemble=result_saccu_ensemble/cross_num;
result_kaccu_ensemble=result_kaccu_ensemble/cross_num;
result_saccu=result_saccu/cross_num;
result_kaccu=result_kaccu/cross_num;
result_saccu_no=result_saccu_no/cross_num;
result_kaccu_no=result_kaccu_no/cross_num;
%%