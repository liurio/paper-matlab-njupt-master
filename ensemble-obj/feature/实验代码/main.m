clear all
data_clear
load soybean.mat;%加载数据集
cm=10;%交叉验证次数
e=0.01;%选取的隐私度
f=[1,9,17,26,35];%soybean
%f=[1,7,15,24,30];%wdbc
%f=[1,10,19,27,34];%ionosphere

%f=[1,3,5,7,9];
[result_saccu_ensemble,result_kaccu_ensemble,result_saccu_obj,result_kaccu_obj,result_saccu_no,result_kaccu_no] = corss( sample,f,cm,e);
knn_tu