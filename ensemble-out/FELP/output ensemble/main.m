clear all
data_clear
load wdbc.mat;%加载数据集
cm=10;%交叉验证次数
e=[0.00000001,0.0000001,0.000001,0.00001,0.0001,0.001,0.01,0.1,1];%选取的隐私度
e1=[0,0,0,0,0,0,0,0,0];%选取的隐私度为0的点
s=[0,1,2,3,4,5,6,7,8];%选取的隐私度个数点，一共9个
K=20;%子集个数
f=floor(size(sample,2)*0.1);%选取的特征个数
sn=size(e,2);%获得隐私度个数
[L_saccu_en_out,L_kaccu_en_out,L_saccu_non,L_kaccu_non,weights_en_out,weights_non] = corss( sample,f,cm,e,e1,K);
%L_saccu_en_out是先集成后加噪声的svm分类器结果，L_kaccu_en_out是先集成后加噪声的knn分类器结果。weights_en_out是先集成后加噪声的权重
%L_saccu_non和L_kaccu_non为不加噪声情况下集成的结果。weights_non：不加噪声情况下集成的权重
tu