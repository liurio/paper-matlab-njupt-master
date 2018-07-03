y1=result_saccu_no;
plot(f,y1,'-^','LineWidth',6)
%plot(log10(e'),y1,'-','LineStyle','^','LineWidth',4)

hold on

y2=result_saccu_out;
plot(f,y2,'--go','LineWidth',6)
%plot(log10(e'),y2,'--g','LineStyle','o','LineWidth',4)
hold on

y3=result_saccu_local;
plot(f,y3,'-.rpentagram','LineWidth',6)
%plot(log10(e'),y3,'-.r','LineStyle','pentagram','LineWidth',4)
hold on

xlabel('Privacy parameter log(\epsilon)','FontWeight','bold','FontSize',24,'FontName','Arial');
ylabel('Classification accuracy','FontWeight','bold','FontSize',24,'FontName','Arial');
legend('FWELL','FWELL-OUT','FWELL-LOCAL','FontWeight','bold','FontSize',24,'FontName','Arial',4);
set(gca, 'FontWeight','bold','FontSize',24,'FontName','Arial')
hold on