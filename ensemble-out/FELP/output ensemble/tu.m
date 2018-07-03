y1=L_kaccu_non;
plot(log10(e'),y1,'-')
hold on

y2=L_kaccu_en_out;
plot(log10(e'),y2,'-r')
hold on

y3=L_saccu_non;
plot(log10(e'),y3,'-')
hold on

y4=L_saccu_en_out;
plot(log10(e'),y4,'-r')

xlabel('Privacy parameter log(\epsilon)');
ylabel('Classification accuracy');
legend('FWELL-EN-3NN','FELP-3NN','FWELL-EN-SVM','FELP-SVM',4);