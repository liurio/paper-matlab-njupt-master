clear all
data_clear
load arcene.mat;%加载数据集
cm=10;%交叉验证次数
e=0.01;%选取的隐私度
s=[0,1,2,3,4,5,6,7,8];%选取的隐私度个数点，一共9个
%f=[1,9,17,27,35];%soybean
f=[1,900,2840,4960,6400,8300,9920];
sn=size(f,2);%获得隐私度个数
[result_saccu_local,result_kaccu_local,result_saccu_out,result_kaccu_out,result_saccu_no,result_kaccu_no] = corss( sample,f,cm,e);
%[result_saccu,result_kaccu] = corss( sample,f,cm,e);

knn_tu