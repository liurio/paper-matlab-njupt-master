y1=result_saccu_no;
plot(log10(e'),y1,'-+','LineWidth',4)
hold on

y2=result_saccu;
plot(log10(e'),y2,'-g','LineWidth',4)
%values = spcrv([log10(e'),y2]',3);
%plot(values(1,:),values(2,:),'-g','LineWidth',4)
hold on

y3=result_saccu_ensemble;
plot(log10(e'),y3,'--*r','LineWidth',4)
%values = spcrv([log10(e'),y3]',3);
%plot(values(1,:),values(2,:),'--*r','LineWidth',4)
hold on
xlabel('Privacy parameter log(\epsilon)');
ylabel('Classification accuracy');
legend('FWELL-EN','FPLE','ENOBJ_FWELL',4);