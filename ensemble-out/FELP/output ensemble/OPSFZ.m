function weights =OPSFZ(z);
[N,p]=size(z);
%z=(z-min(z(:)))/(max(z(:))-min(z(:)));
delta_w(1,p)=0;
afa=0;
W=ones(1,p);
beta(1,p)=0;
%for j=1:50
 for i=1:N
    
     afa=exp(-dot(W(1,:),z(i,:)));
     
     beta(1,:)=beta(1,:)+ (afa/(1+ afa))*z(i,:);%�����ۺ�����һ���
     beta=beta/N;
  delta_w=delta_w-beta(1,:)+2*0.4*W(1,:);%�����޸ĺ������Ȩ��֮��,L2�������ϵ��Ϊ1�����Ե���
    W=W-delta_w;
 %    W=W-beta;
     %W=W/norm(W);
 end
%end
%for j=1:m
 %   We(j,:)=W(j,:)-delta_w(j,:);%�Ż����Ȩ��
%end
weights=W;