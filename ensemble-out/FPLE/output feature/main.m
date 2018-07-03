clear all
data_clear
load ionosphere.mat;%加载数据集
cm=10;%交叉验证次数
e=0.01;%选取的隐私度
e1=0;%选取的隐私度为0的点
K=20;%子集个数
%f=[1,8,15,22,30];%选取的特征个数
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
[L_saccu_out_en,L_kaccu_out_en,L_saccu_en_out,L_kaccu_en_out,L_saccu_non,L_kaccu_non,weights_out_en,weights_en_out,weights_non]= corss( sample,f,cm,e,e1,K);%集成分类准确率结果，其中L_saccu_e是先加噪声后集成的svm分类器结果，L_kaccu_e是先加噪声后集成的knn分类器结果。L_saccu是先集成后加噪声的svm分类器结果，L_kaccu是先集成后加噪声的knn分类器结果。L_saccu4n和L_kaccu4n为不加噪声情况下集成的结果
knn_tu