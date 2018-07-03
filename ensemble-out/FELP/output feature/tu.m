y1=L_kaccu_non;
plot(f',y1,'-')
hold on

y2=L_kaccu_en_out;
plot(f',y2,'-r')
hold on

y3=L_saccu_non;
plot(f',y3,'-')
hold on

y4=L_saccu_en_out;
plot(f',y4,'-r')

xlabel('The number of selected features');
ylabel('Classification accuracy');
legend('FWELL-EN-3NN','FELP-3NN','FWELL-EN-SVM','FELP-SVM',4);