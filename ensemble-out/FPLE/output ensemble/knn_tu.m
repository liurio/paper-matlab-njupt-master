y1=L_kaccu_non;
plot(log10(e'),y1,'-')
%values = spcrv([log10(e'),y1]',3);
%plot(values(1,:),values(2,:))
hold on

y2=L_kaccu_out_en;
plot(log10(e'),y2,'-g')
%values = spcrv([log10(e'),y2]',3);
%plot(values(1,:),values(2,:),'*r')
hold on

y3=L_kaccu_en_out;
plot(log10(e'),y3,'-r')

%% y3=L_kaccu_obj;
%values = spcrv([log10(e'),y3]',3);
%plot(values(1,:),values(2,:),'.g')
%hold on

%% y4=L_kaccu_fu;
% values = spcrv([log10(e'),y4]',3);
% plot(values(1,:),values(2,:),'+')
% hold on
xlabel('Privacy parameter log(\epsilon)');
ylabel('Classification accuracy');
legend('FWELL-EN','FPLE','FELP',4);