function [ saccu,kaccu ] = SVM_KNN( train,test,w_site_out,f)
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
fd=size(train,2);%��ȡѵ������ά��
fd=fd-1;%��ȡѵ������������
train_data=train(:,w_site_out(:,(fd-f+1):fd));
test_data=test(:,w_site_out(:,(fd-f+1):fd));
N=size(train,2);
m=size(test,1);
train_label=train(:,N);
test_label=test(:,N);
weight=ones(1,N-1);
%%��ѵ�����ݺͲ������ݽ��й�һ������
[mtrain,ntrain] = size(train_data);
[mtest,ntest] = size(test_data);
test_dataset = [train_data;test_data];
[dataset_scale,ps] = mapminmax(test_dataset',0,1);% mapminmaxΪMATLAB�Դ��Ĺ�һ������
dataset_scale = dataset_scale';
train_data = dataset_scale(1:mtrain,:);
test_data = dataset_scale( (mtrain+1):(mtrain+mtest),: );
%%SVM�������Ĵ���
model=svmtrain(train_label,train_data);
[predict_label,accuracy,dec_value]=svmpredict(test_label,test_data,model);
saccu=accuracy(1,1)/100;
%%KNN�������Ĵ���
label4=KNN([train_data,train_label],test_data,2,3);
kaccu=KNNaccu(m,label4,test_label);


