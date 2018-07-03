y1=L_kaccu_non;
plot(f',y1,'-')
hold on

y2=L_kaccu_out_en;
plot(f',y2,'-g')
hold on

y3=L_kaccu_en_out;
plot(f',y3,'-r')
xlabel('The number of selected features');
ylabel('Classification accuracy');
legend('FWELL-EN','FPLE','FELP',4);