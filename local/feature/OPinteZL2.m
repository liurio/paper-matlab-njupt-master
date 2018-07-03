function [We_inte,We_rank] =OPinteZL2(z,W,m);
%����z��mΪ����������W�����õ���m���������Ȩ��ֵ
 ssubzsize=z{1};
 [N,p]=size(ssubzsize);
%z=(z-min(z(:)))/(max(z(:))-min(z(:)));
W=(W-min(W(:)))/(max(W(:))-min(W(:)));%��һ��
 delta_w(m,p)=0;
 afa=0;
 beta(1,p)=0;
 for j=1:m%m��w����
   W(j,:)=W(j,:)/norm(W(j,:),2);%��һ��
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
 We_inte=sum(W)/m;%����Ȩ��
 [w,s]=sort(We_inte);
   for d=1:p%pΪ��������
       We_inte(1,s(d))=p-d+1;
   end
 for j=1:m
             [w,s]=sort(Wrank(j,:));%�޸ĺ�Ĵ���
     for d=1:p%pΪ��������
 
         Wrank(j,s(d))=p-d+1;
     end
 end
 We_rank=sum(Wrank)/m;

