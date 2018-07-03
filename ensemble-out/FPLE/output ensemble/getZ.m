function [z]=getZ(sample)
[N,p]=size(sample);
Y=sample(:,p);
p=p-1;
X=sample(:,1:p);
X=(X-min(X(:)))/(max(X(:))-min(X(:)));
[P_pos, P_neg, mindist_pos, mindist_neg, marginList] = reliefHelper(X, X.^2, Y,  ones(1,p), 1:N);%求出nearhit,nearmiss

    z(N,p)=0;
    
for i=1:N
   
   z(i,:)=abs(X(i,:)-X(P_neg(i),:))-abs(X(i,:)-X(P_pos(i),:));%求出向量
  
end