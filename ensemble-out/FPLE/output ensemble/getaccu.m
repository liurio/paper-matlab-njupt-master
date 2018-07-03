function [saccu_e,kaccu_e,saccu,kaccu,saccu_n,kaccu_n,weights_out_en,weights_en_out,weights_non] = getaccu( train,test,e,e1,f,k)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
%train:训练集
%fn:选择的特征维数
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
num_e=size(e,2);%噪声的个数
for t=1:num_e
    R(t,:)=gamrnd(0.1,2/(m*0.9*e(t)*0.4),1,p);%其中R = gamrnd(a,2/(n*e*1.9),1,m);1.9是正则化参数，正则化参数必须与OPSFZ函数中的正则化参数一致，m是特征个数，n是样本个数，e是隐私度
end
weight_eee=0;
weight1=weight;
for l=1:k
    for i=1:num_e
        weight_e(i,:)=weight1(l,:)+R(i,:);%添加噪声
    end
    weight_e
    weight_ee{l}=weight_e;
    weight_eee=weight_eee+weight_ee{l};
end
weights_eeee=weight_eee/k;%集成
weights_out_en=weights_eeee;
num_w=size(weights_eeee,1);
for n=1:num_w
        [w_weight3,w_site3]=sort(weights_eeee(n,:));%特征权重排序
        [saccu3,kaccu3] =SVM_KNN( train,test,w_site3,f);%分类器获得分类准确率
        saccu_e(n,:)=saccu3;
        kaccu_e(n,:)=kaccu3;
end
%%先集成后加噪声
ss=size(e,2);
for t=1:ss
     H(t,:)=gamrnd(0.1,2/(m*0.9*e(t)*0.4),1,p);%获得噪声向量
end
weights=sum(weight)/k;%先集成
weights1=weights;
fs=size(e,2);
for j=1:fs
    weights_e=weights1+H(j,:);%加噪声
    [w_weight4,w_site4]=sort(weights_e);
    [saccu1,kaccu1] =SVM_KNN( train,test,w_site4,f);%分类器获得分类准确率
    saccu(j,:)=saccu1;
    kaccu(j,:)=kaccu1;
    weights_e1(:,j)=weights_e;
end
weights_en_out=weights_e1;
%%不加噪声   
fs_1=size(e1,2);
for k=1:fs_1
    [w_weight5,w_site5]=sort(weights1);%对不加噪声的集成结果排序
    [saccu2,kaccu2] =SVM_KNN( train,test,w_site5,f);%分类器获得分类准确率
    saccu_n(k,:)=saccu2;
    kaccu_n(k,:)=kaccu2;
    weights_e2(:,k)=weights1;
end
weights_non=weights_e2;

