function weight_obj =OPSFZ(z,R);
[N,p]=size(z);%��ȡz������������
delta_w(1,p)=0;%���м������ʼ��
afa=0;%��ʼ����
W=ones(1,p);%������Ȩ�س�ʼ��
beta(1,p)=0;%��ʼ����
for i=1:N
     afa=exp(-dot(W(1,:)/1,z(i,:)));
     beta(1,:)=beta(1,:)- (afa/(1+ afa))*z(i,:);%�����ۺ�����һ���
     beta=beta/N;
     delta_w=delta_w+beta(1,:)+2*1.9*W(1,:)+R/N;%�����޸ĺ������Ȩ��֮��,L2�������ϵ��Ϊ1.9�����Ե���
     W=W-delta_w;
end
%%
weight_obj=W