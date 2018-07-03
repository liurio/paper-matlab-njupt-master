function [ saccu,kaccu ] = SVM_KNN( train,test,w_site_out,f)
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
fd=size(train,2);%获取训练集的维度
fd=fd-1;%获取训练集的特征数
train_data=train(:,w_site_out(:,(fd-f+1):fd));
test_data=test(:,w_site_out(:,(fd-f+1):fd));
N=size(train,2);
m=size(test,1);
train_label=train(:,N);
test_label=test(:,N);
weight=ones(1,N-1);
%%将训练数据和测试数据进行归一化处理
[mtrain,ntrain] = size(train_data);
[mtest,ntest] = size(test_data);
test_dataset = [train_data;test_data];
[dataset_scale,ps] = mapminmax(test_dataset',0,1);% mapminmax为MATLAB自带的归一化函数
dataset_scale = dataset_scale';
train_data = dataset_scale(1:mtrain,:);
test_data = dataset_scale( (mtrain+1):(mtrain+mtest),: );
%%SVM分类器的处理
model=svmtrain(train_label,train_data);
[predict_label,accuracy,dec_value]=svmpredict(test_label,test_data,model);
saccu=accuracy(1,1)/100;
%%KNN分类器的处理
label4=KNN([train_data,train_label],test_data,2,3);
kaccu=KNNaccu(m,label4,test_label);


