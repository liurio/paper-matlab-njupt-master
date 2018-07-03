function weights =OPSFZ_local(z,e);
[N,p]=size(z);%��ȡz������������
delta_w(1,p)=0;%���м������ʼ��
afa=0;%��ʼ����
W=ones(1,p);%������Ȩ�س�ʼ��
beta(1,p)=0;%��ʼ����
beta=zeros(1,p);
j=floor(unifrnd(1,p));
for i=1:N     
     afa=exp(-dot(W(1,:)/1,z(i,:)));
     beta(1,:)=beta(1,:)- (afa/(1+ afa))*z(i,:);%�����ۺ�����һ���
     beta=beta/N;   
     
     if beta(1,j)>0
        beta(1,j)=(exp(e)+1)/(exp(e)+1)*p;
     else if beta(1,j)<0
              beta(1,j)=-(exp(e)+1)/(exp(e)+1)*p;
         else
             beta(1,j)=0;
         end
     end
     delta_w=delta_w+beta(1,:)+2*1.9*W(1,:);%�����޸ĺ������Ȩ��֮��,L2�������ϵ��Ϊ1.9�����Ե���  
     W=W-delta_w;
end
%%
weights=W;