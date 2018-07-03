y1=L_saccu_non;
plot(log10(e'),y1,'-')
%values = spcrv([log10(e'),y1]',3);
%plot(values(1,:),values(2,:))
hold on

y2=L_saccu_out_en;
plot(log10(e'),y2,'-g')
%values = spcrv([log10(e'),y2]',3);
%plot(values(1,:),values(2,:),'*r')
hold on

y3=L_saccu_en_out;
plot(log10(e'),y3,'-r')
%values = spcrv([log10(e'),y3]',3);
%plot(values(1,:),values(2,:),'-r')
hold on
%% y2=L_saccu_obj;
%values = spcrv([log10(e'),y2]',3);
%plot(values(1,:),values(2,:),'.g')
%hold on

xlabel('Privacy parameter log(\epsilon)');
ylabel('Classification accuracy');
legend('FWELL-EN','FPLE','FELP',4);