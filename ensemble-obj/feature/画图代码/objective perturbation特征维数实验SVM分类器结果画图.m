for i=1:5
y(1,i)=L_saccu(i,1);
end
values = spcrv([[s(1) s s(end)];[y(1) y y(end)]],3);
plot(values(1,:),values(2,:))
hold on
for i=1:5
y(1,i)=L_saccu4n(i,1);
end
values = spcrv([[s(1) s s(end)];[y(1) y y(end)]],3);
plot(values(1,:),values(2,:))
hold on
xlabel('The numbe of selected features');
ylabel('Classification accuracy');
legend('Objective FWELL','FWELL');