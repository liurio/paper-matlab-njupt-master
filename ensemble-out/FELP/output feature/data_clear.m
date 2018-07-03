sample=load('ionosphere.txt');
save ionosphere
[x1,x2]=size(sample);
a=sample(:,x2)';
z=sample(:,1:x2-1);

