function [result_saccu_e,result_kaccu_e,result_saccu,result_kaccu,result_saccu_n,result_kaccu_n,weights_out_en3,weights_en_out3,weights_non3] = corss( sample,f,cross_num,e,e1,K)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
%sample:ԭʼ���ݼ�
%cm:������֤������ʵ�����10�ν�����֤
%f:ѡ��Ĳ�ͬ����ά���������ݼ�����,����f=(10,20,30,40,50)
[m,n]=size(sample);%��ȡ���ݼ�������������������
fs=size(f,2);%ѡȡ�������ĸ���
subsam_num=floor(m/cross_num);%ÿ�ν�����֤���ֵ��Ӽ�������
for i=1:cross_num
    sam{i}=sample((i-1)*subsam_num+1:i*subsam_num,:);%�������Ӽ�����10�ȷ�
end
com=[2 3 4 5 6 7 8 9 10;1 3 4 5 6 7 8 9 10;1 2 3 5 6 7 8 9 10;1 2 4 5 6 7 8 9 10;1 2 3 4 6 7 8 9 10;1 2 3 4 5 7 8 9 10; 1 2 3 4 5 6 8 9 10;1 2 3 4 5 6 7 9 10;1 2 3 4 5 6 7 8 10;1 2 3 4 5 6 7 8 9];
for i=1:cross_num%���н�����֤
    test=sam{i};%ѡ��10�ȷ��еĵ�i����Ϊ���Լ�
    train=[sam{com(i,1)};sam{com(i,2)};sam{com(i,3)};sam{com(i,4)};sam{com(i,5)};sam{com(i,6)};sam{com(i,7)};sam{com(i,8)};sam{com(i,9)}];%ѡ��10�ȷ��е������ȷ���Ϊѵ����
    for j=1:fs
        [saccu_e1,kaccu_e1,saccu1,kaccu1,saccu_n1,kaccu_n1,weights_out_en1,weights_en_out1,weights_non1] =getaccu( train,test,e,e1,f(j),K);%���з���׼ȷ��ʵ��
        saccu_e2(j,:)=saccu_e1;
        kaccu_e2(j,:)=kaccu_e1;
        saccu2(j,:)=saccu1;
        kaccu2(j,:)=kaccu1;
        saccu_n2(j,:)=saccu_n1;
        kaccu_n2(j,:)=kaccu_n1;
        weights_non2(j,:)=weights_non1;
        weights_out_en2(j,:)=weights_out_en1;
        weights_en_out2(j,:)=weights_en_out1;
    end
    saccuracy{i}=saccu2;
    kaccuracy{i}=kaccu2;
    saccuracy_n{i}=saccu_n2;
    kaccuracy_n{i}=kaccu_n2;
    saccuracy_e{i}=saccu_e2;
    kaccuracy_e{i}=kaccu_e2;
    weights_out_en3{i}=weights_out_en2;
    weights_en_out3{i}=weights_en_out2;
    weights_non3{i}=weights_non2;
end
result_saccu=0;%�ȼ��ɺ������������׼ȷ�ʽ����ʼ��
result_kaccu=0;%�ȼ��ɺ������������׼ȷ�ʽ����ʼ��
result_saccu_n=0;%�����������ɵ�����׼ȷ�ʽ����ʼ��
result_kaccu_n=0;%�����������ɵ�����׼ȷ�ʽ����ʼ��
result_saccu_e=0;%�ȼ������󼯳ɵ�����׼ȷ�ʽ����ʼ��
result_kaccu_e=0;%�ȼ������󼯳ɵ�����׼ȷ�ʽ����ʼ��
%%��10�ν�����֤ȡƽ��
for i=1:cross_num
    result_saccu=result_saccu+saccuracy{i};
    result_kaccu=result_kaccu+kaccuracy{i};
    result_saccu_n=result_saccu_n+saccuracy_n{i};
    result_kaccu_n=result_kaccu_n+kaccuracy_n{i};    
    result_saccu_e=result_saccu_e+saccuracy_e{i};
    result_kaccu_e=result_kaccu_e+kaccuracy_e{i};    
end
result_saccu=result_saccu/cross_num;
result_kaccu=result_kaccu/cross_num;
result_saccu_n=result_saccu_n/cross_num;
result_kaccu_n=result_kaccu_n/cross_num;
result_saccu_e=result_saccu_e/cross_num;
result_kaccu_e=result_kaccu_e/cross_num;
%%