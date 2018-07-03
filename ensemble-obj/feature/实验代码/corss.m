function [result_saccu_ensemble,result_kaccu_ensemble,result_saccu,result_kaccu,result_saccu_no,result_kaccu_no] = corss( sample,f,cross_num,e)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
%sample:原始数据集
%cm:交叉验证次数，实验采用10次交叉验证
%f:选择的不同特征维数，由数据集决定.

fprintf('this is corss!\n')
[m,n]=size(sample);%获取数据集特征个数与样本个数
fs=size(f,2);%特征的个数
subsam_num=floor(m/cross_num);%每次交叉验证所分的子集样本数
for i=1:cross_num
    sam{i}=sample((i-1)*subsam_num+1:i*subsam_num,:);%对样本子集划分10等份
end
com=[2 3 4 5 6 7 8 9 10;1 3 4 5 6 7 8 9 10;1 2 3 5 6 7 8 9 10;1 2 4 5 6 7 8 9 10;1 2 3 4 6 7 8 9 10;1 2 3 4 5 7 8 9 10; 1 2 3 4 5 6 8 9 10;1 2 3 4 5 6 7 9 10;1 2 3 4 5 6 7 8 10;1 2 3 4 5 6 7 8 9];
for i=1:cross_num%进行交叉验证
    fprintf('\n')
    fprintf('begin to 第 %i 次交叉验证\n', i)
    test=sam{i};%选定10等份中的第i份作为测试集
    train=[sam{com(i,1)};sam{com(i,2)};sam{com(i,3)};sam{com(i,4)};sam{com(i,5)};sam{com(i,6)};sam{com(i,7)};sam{com(i,8)};sam{com(i,9)}];%选定10等份中的其他等份作为训练集   
    for j=1:fs       
         fprintf('begin 第 %i 次交叉验证, 第 %j 个隐私度.   f(j)=%j\n', i,j,f(j))
         %[saccu4,kaccu4,weights] =getsinaccu( train,test,e(j),f);%对所选定的隐私度进行分类准确率实验
         [saccu_ensemble,kaccu_ensemble,saccu4,kaccu4,saccu_no4,kaccu_no4] =getaccu(sample, train,test,e,f(j));%进行分类准确率实验
         saccu_ensemble1(j,:)=saccu_ensemble;
         kaccu_ensemble1(j,:)=kaccu_ensemble;
         saccu1(j,:)=saccu4;
         kaccu1(j,:)=kaccu4;
         saccu_no1(j,:)=saccu_no4;
         kaccu_no1(j,:)=kaccu_no4;
         fprintf('end 第 %i 次交叉验证, 第 %j 个隐私度\n', i,j)
         fprintf('\n')
    end
    saccuracy_ensemble{i}=saccu_ensemble1;
    kaccuracy_ensemble{i}=kaccu_ensemble1;
    saccuracy{i}=saccu1;
    kaccuracy{i}=kaccu1;
    saccuracy_no{i}=saccu_no1;
    kaccuracy_no{i}=kaccu_no1;
    fprintf('end begin to 第 %i 次交叉验证\n', i)
    fprintf('\n')
end
result_saccu_ensemble=0;
result_kaccu_ensemble=0;
result_saccu=0;
result_kaccu=0;
result_saccu_no=0;
result_kaccu_no=0;
%%将10次交叉验证取平均
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