function [result_saccu,result_kaccu,result_saccu_n,result_kaccu_n,weights_en_out3,weights_non3] = corss( sample,f,cross_num,e,e1,K)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
%sample:原始数据集
%cm:交叉验证次数，实验采用10次交叉验证
%f:选择的不同特征维数，由数据集决定.
[m,n]=size(sample);%获取数据集特征个数与样本个数
fs=size(e,2);%隐私度的个数
subsam_num=floor(m/cross_num);%每次交叉验证所分的子集样本数
for i=1:cross_num
    sam{i}=sample((i-1)*subsam_num+1:i*subsam_num,:);%对样本子集划分10等份
end
com=[2 3 4 5 6 7 8 9 10;1 3 4 5 6 7 8 9 10;1 2 3 5 6 7 8 9 10;1 2 4 5 6 7 8 9 10;1 2 3 4 6 7 8 9 10;1 2 3 4 5 7 8 9 10; 1 2 3 4 5 6 8 9 10;1 2 3 4 5 6 7 9 10;1 2 3 4 5 6 7 8 10;1 2 3 4 5 6 7 8 9];
for i=1:cross_num%进行交叉验证
    test=sam{i};%选定10等份中的第i份作为测试集
    train=[sam{com(i,1)};sam{com(i,2)};sam{com(i,3)};sam{com(i,4)};sam{com(i,5)};sam{com(i,6)};sam{com(i,7)};sam{com(i,8)};sam{com(i,9)}];%选定10等份中的其他等份作为训练集
    [saccu1,kaccu1,saccu_n1,kaccu_n1,weights_en_out1,weights_non1] =getaccu( train,test,e,e1,f,K);%进行分类准确率实验
    saccuracy{i}=saccu1;
    kaccuracy{i}=kaccu1;
    saccuracy_n{i}=saccu_n1;
    kaccuracy_n{i}=kaccu_n1;
    weights_en_out3{i}=weights_en_out1';
    weights_non3{i}=weights_non1';
end
result_saccu=0;%先集成后加噪声的最终准确率结果初始化
result_kaccu=0;%先集成后加噪声的最终准确率结果初始化
result_saccu_n=0;%不加噪声集成的最终准确率结果初始化
result_kaccu_n=0;%不加噪声集成的最终准确率结果初始化
%%将10次交叉验证取平均
for i=1:cross_num
    result_saccu=result_saccu+saccuracy{i};
    result_kaccu=result_kaccu+kaccuracy{i};
    result_saccu_n=result_saccu_n+saccuracy_n{i};
    result_kaccu_n=result_kaccu_n+kaccuracy_n{i};     
end
result_saccu=result_saccu/cross_num;
result_kaccu=result_kaccu/cross_num;
result_saccu_n=result_saccu_n/cross_num;
result_kaccu_n=result_kaccu_n/cross_num;
%%