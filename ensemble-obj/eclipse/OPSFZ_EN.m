function weight_en =OPSFZ_EN(z,R,K);
[N,p]=size(z);%获取z的行数和列数
delta_w(K,p)=0;%对中间变量初始化
afa=0;%初始化α
W=ones(K,p);%对特征权重初始化
beta(K,p)=0;%初始化β
for j=1:K
	for i=1:N
        afa=exp(-dot(W(j,:)/K,z(i,:)));
	     beta(j,:)=beta(j,:)- (afa/(1+ afa))*z(i,:);%求评价函数第一项导数
	     beta=beta/(N*K);
	     delta_w(j,:)=delta_w(j,:)+beta(1,:)+2*1.9*W(j,:)+R/N;%计算修改后的特征权重之和,L2正则项的系数为1.9，可以调整
	     W(j,:)=W(j,:)-delta_w(j,:);
	end	
end
%%
weight_en=sum(W)/K