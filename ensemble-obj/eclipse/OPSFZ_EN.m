function weight_en =OPSFZ_EN(z,R,K);
[N,p]=size(z);%��ȡz������������
delta_w(K,p)=0;%���м������ʼ��
afa=0;%��ʼ����
W=ones(K,p);%������Ȩ�س�ʼ��
beta(K,p)=0;%��ʼ����
for j=1:K
	for i=1:N
        afa=exp(-dot(W(j,:)/K,z(i,:)));
	     beta(j,:)=beta(j,:)- (afa/(1+ afa))*z(i,:);%�����ۺ�����һ���
	     beta=beta/(N*K);
	     delta_w(j,:)=delta_w(j,:)+beta(1,:)+2*1.9*W(j,:)+R/N;%�����޸ĺ������Ȩ��֮��,L2�������ϵ��Ϊ1.9�����Ե���
	     W(j,:)=W(j,:)-delta_w(j,:);
	end	
end
%%
weight_en=sum(W)/K