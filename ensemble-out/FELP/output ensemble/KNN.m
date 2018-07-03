%KNN classifiers, 
%training is training set, testing is test set, 
%D is the  distance, D=1 is mandistance; D=2 is ŷ�Ͼ��� D=3�� infinite norm
% K is the number of selected neighbors
function label=KNN(training,testing,D,K)
[row, column]=size(training);
[row1, column1]=size(testing);
%������Լ���ѵ�����ľ���
distance=[];
if D==1
   for i=1:row1
        for j=1:row
            temp=[training(j,[1:(column-1)]);testing(i,:)];
            d=mandist(temp);
            distance(i,j)=d(1,2);
        end
    end
end
if D==2   
   for i=1:row1
        for j=1:row
            temp=[training(j,[1:(column-1)]);testing(i,:)]';
            d=dist(temp);
            distance(i,j)=d(1,2);
        end
    end
end
if D==3
    for i=1:row1
        for j=1:row
            temp=[training(j,[1:(column-1)]);testing(i,:)];
            d=max(abs(temp(1,:)-temp(2,:)));
            distance(i,j)=d;
        end
    end
end
% Ѱ��k������
label=[];
for i=1:row1
    [a,b]=sort(distance(i,:));
    neighbors=b(1:K)';
    neighbors_D=training(neighbors,column);
    [x,y]=sort(neighbors_D);
    temp=find(diff(x)~=0);        
    nei_d=[x(1);x(temp+1)];
    Num_D=[];
    for j=1:length(nei_d)
        num=length(find(neighbors_D==nei_d(j)));
        Num_D=[Num_D,num];
    end
    [a,b]=max(Num_D);
    label(i)=nei_d(b);
end
        
