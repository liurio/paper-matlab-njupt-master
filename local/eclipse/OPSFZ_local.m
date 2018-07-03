function weights =OPSFZ_local(z,e);
[N,p]=size(z);%获取z的行数和列数
delta_w(1,p)=0;%对中间变量初始化
afa=0;%初始化α
W=ones(1,p);%对特征权重初始化
beta(1,p)=0;%初始化β
beta=zeros(1,p);
j=floor(unifrnd(1,p));
for i=1:N     
     afa=exp(-dot(W(1,:)/1,z(i,:)));
     beta(1,:)=beta(1,:)- (afa/(1+ afa))*z(i,:);%求评价函数第一项导数
     beta=beta/N;   
     
     if beta(1,j)>0
        beta(1,j)=(exp(e)+1)/(exp(e)+1)*p;
     else if beta(1,j)<0
              beta(1,j)=-(exp(e)+1)/(exp(e)+1)*p;
         else
             beta(1,j)=0;
         end
     end
     delta_w=delta_w+beta(1,:)+2*1.9*W(1,:);%计算修改后的特征权重之和,L2正则项的系数为1.9，可以调整  
     W=W-delta_w;
end
%%
weights=W;