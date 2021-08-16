%FETSM
figure(1);%joint 1
plot(t,T(:,1),'-','color','b','linewidth',0.1);
xlabel('{\itt}/s');ylabel('\tau/(N\cdotm)');legend('FETSM');
figure(2);%joint 2
plot(t,T(:,2),'-','color','b','linewidth',0.1);
xlabel('{\itt}/s');ylabel('\tau/(N\cdotm)');legend('FETSM');
figure(3);%joint 1
plot(t,y1(:,1),'-','color','k','LineWidth',1.5);hold on;plot(t,y1(:,3),':','color','b','LineWidth',3);
xlabel('{\itt}/s');ylabel('{\itq}/rad');legend('Ideal position','FETSM');
figure(4);%joint 2
plot(t,y1(:,2),'-','color','k','LineWidth',1.5);hold on;plot(t,y1(:,4),':','color','b','LineWidth',3);
xlabel('{\itt}/s');ylabel('{\itq}/rad');legend('Ideal position','FETSM');
