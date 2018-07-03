function [We_inte,We_rank] =OPinteZL2(z,W,m);
%输入z，m为抽样次数，W抽样得到的m个特征输出权重值
 ssubzsize=z{1};
 [N,p]=size(ssubzsize);
%z=(z-min(z(:)))/(max(z(:))-min(z(:)));
W=(W-min(W(:)))/(max(W(:))-min(W(:)));%归一化
 delta_w(m,p)=0;
 afa=0;
 beta(1,p)=0;
 for j=1:m%m个w集成
   W(j,:)=W(j,:)/norm(W(j,:),2);%归一化
    beta(1,p)=0;
    ssubz=z{j};

    for i=1:N
        
        afa=afa+exp(-dot(W(j,:),ssubz(i,:))/m);
        beta(1,:)=beta(1,:)+ (afa/(1+ afa))*ssubz(i,:);
    end
       
   beta=beta/N;
   delta_w(j,:)=delta_w(j,:)-beta(1,:)./m+2*W(j,:)./m;%  
   W(j,:)=W(j,:)-delta_w(j,:);
   
 end
 Wrank=W;
 We_inte=sum(W)/m;%集成权重
 [w,s]=sort(We_inte);
   for d=1:p%p为特征个数
       We_inte(1,s(d))=p-d+1;
   end
 for j=1:m
             [w,s]=sort(Wrank(j,:));%修改后的代码
     for d=1:p%p为特征个数
 
         Wrank(j,s(d))=p-d+1;
     end
 end
 We_rank=sum(Wrank)/m;

