function c=KNNaccu(m,label,testing)
count=0;
n=label';
for i=1:m
    if n(i)==testing(i)
        count=count+1;
    end
end
c=count/m;