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
     
     beta(1,:)=beta(1,:)+ (afa/(1+ afa))*z(i,:);%求评价函数第一项导数
     beta=beta/N;
  delta_w=delta_w-beta(1,:)+2*0.4*W(1,:);%计算修改后的特征权重之和,L2正则项的系数为1，可以调整
    W=W-delta_w;
 %    W=W-beta;
     %W=W/norm(W);
 end
%end
%for j=1:m
 %   We(j,:)=W(j,:)-delta_w(j,:);%优化后的权重
%end
weights=W;