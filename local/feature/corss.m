function [result_saccu_local,result_kaccu_local,result_saccu_out,result_kaccu_out,result_saccu_no,result_kaccu_no] = corss( sample,f,cross_num,e)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
%sample:ԭʼ���ݼ�
%cm:������֤������ʵ�����10�ν�����֤
%f:ѡ��Ĳ�ͬ����ά���������ݼ�����.

fprintf('this is corss!\n')
[m,n]=size(sample);%��ȡ���ݼ�������������������
fs=size(f,2);%��˽�ȵĸ���
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
         fprintf('begin �� %i �ν�����֤, �� %i ����˽��. \n', i,j)
         %[saccu4,kaccu4,weights] =getsinaccu( train,test,e(j),f);%����ѡ������˽�Ƚ��з���׼ȷ��ʵ��
         [saccu_local,kaccu_local,saccu_out,kaccu_out,saccu_no,kaccu_no] =getaccu(sample, train,test,e,f(j));%���з���׼ȷ��ʵ��
         saccu_local1(j,:)=saccu_local;
         kaccu_local1(j,:)=kaccu_local;
         saccu_out1(j,:)=saccu_out;
         kaccu_out1(j,:)=kaccu_out;
         saccu_no1(j,:)=saccu_no;
         kaccu_no1(j,:)=kaccu_no;
         fprintf('end �� %i �ν�����֤, �� %i ����˽��\n', i,j)
         fprintf('\n')
    end
    saccuracy_local{i}=saccu_local1;
    kaccuracy_local{i}=kaccu_local1;
    saccuracy_out{i}=saccu_out1;
    kaccuracy_out{i}=kaccu_out1;
    saccuracy_no{i}=saccu_no1;
    kaccuracy_no{i}=kaccu_no1;
    fprintf('end begin to �� %i �ν�����֤\n', i)
    fprintf('\n')
end
result_saccu_local=0;
result_kaccu_local=0;
result_saccu_out=0;
result_kaccu_out=0;
result_saccu_no=0;
result_kaccu_no=0;
%%��10�ν�����֤ȡƽ��
for i=1:cross_num
    result_saccu_local=result_saccu_local+saccuracy_local{i};
    result_kaccu_local=result_kaccu_local+kaccuracy_local{i}; 
    result_saccu_out=result_saccu_out+saccuracy_out{i};
    result_kaccu_out=result_kaccu_out+kaccuracy_out{i};  
    result_saccu_no=result_saccu_no+saccuracy_no{i};
    result_kaccu_no=result_kaccu_no+kaccuracy_no{i}; 
end
result_saccu_local=result_saccu_local/cross_num;
result_kaccu_local=result_kaccu_local/cross_num;
result_saccu_out=result_saccu_out/cross_num;
result_kaccu_out=result_kaccu_out/cross_num;
result_saccu_no=result_saccu_no/cross_num;
result_kaccu_no=result_kaccu_no/cross_num;
%%