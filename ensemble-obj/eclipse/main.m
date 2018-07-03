clear all
data_clear
load arcene.mat;%加载数据集
cm=10;%交叉验证次数
e=[0.00000001,0.0000001,0.000001,0.00001,0.0001,0.001,0.01,0.1,1];%选取的隐私度
e1=[0,0,0,0,0,0,0,0,0];%选取的隐私度为0的点
s=[0,1,2,3,4,5,6,7,8];%选取的隐私度个数点，一共9个
f=floor(size(sample,2)*0.1);%选取的特征个数
[result_saccu_ensemble,result_kaccu_ensemble,result_saccu,result_kaccu,result_saccu_no,result_kaccu_no] = corss( sample,f,cm,e);
knn_tu