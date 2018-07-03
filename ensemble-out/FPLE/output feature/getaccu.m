function [saccu_e111,kaccu_e111,saccu,kaccu,saccu_n,kaccu_n,weights_out_en,weights_en_out,weights_non] = getaccu( train,test,e,e1,f,k)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
%train:训练集
%输出：saccu：采用svm算法的准确率，kaccu采用knn算法的分类准确率，这里采用3近邻
[m,p]=size(train);%获取训练集的样本个数和维度
p=p-1;%获取训练集的特征数
for s=1:k%得到s个抽样样本，样本数为0.9*m
    subrank=randperm(m);%随机产生1到m之间的数的排列
    subsam=train(subrank,:);%得到重新排列后的样本
    subsam=subsam(1:floor(0.9*m),:);%选择前90%的样本
    z=getZ(subsam);%求得基于局部学习的特征权重算法的参数z
    weights4=OPSFZ(z);%基于局部学习的特征权重算法
    weight(s,:)=weights4;
end

%%先加噪声后集成
R=gamrnd(0.03,2/(m*0.9*e*0.4),1,p);
for l=1:k
    [w_weight3,w_site3]=sort(weight_e(l,:));%特征权重排序
    [saccu3,kaccu3] =SVM_KNN( train,test,w_site3,f);%分类器获得分类准确率
    saccu_e(l,:)=saccu3;
    kaccu_e(l,:)=kaccu3;
end
weights_eeee=sum(weight_e)/k;%集成
saccu_e111=sum(saccu_e)/k;
kaccu_e111=sum(kaccu_e)/k;
weights_out_en=weights_eeee;

%%先集成后加噪声
weights=sum(weight)/k;%先集成
weights_e=weights+R;%加噪声
[w_weight4,w_site4]=sort(weights_e);
[saccu,kaccu] =SVM_KNN( train,test,w_site4,f);%分类器获得分类准确率
weights_en_out=weights_e;

%%不加噪声   
[w_weight5,w_site5]=sort(weights);%对不加噪声的集成结果排序
[saccu_n,kaccu_n] =SVM_KNN( train,test,w_site5,f);%分类器获得分类准确率
weights_non=weights;

