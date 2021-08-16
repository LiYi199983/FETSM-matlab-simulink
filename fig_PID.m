%PID
figure(1);%joint 1
plot(t,T(:,1),'-','color','m','linewidth',0.1);
xlabel('{\itt}/s');ylabel('\tau/(N\cdotm)');legend('PID');
figure(2);%joint 2
plot(t,T(:,2),'-','color','m','linewidth',0.1);
xlabel('{\itt}/s');ylabel('\tau/(N\cdotm)');legend('PID');
figure(3);%joint 1
plot(t,y1(:,1),'-','color','k','LineWidth',1.5);hold on;plot(t,y1(:,3),':','color','m','LineWidth',3);
xlabel('{\itt}/s');ylabel('{\itq}/rad');legend('Ideal position','PID');
figure(4);%joint 2
plot(t,y1(:,2),'-','color','k','LineWidth',1.5);hold on;plot(t,y1(:,4),':','color','m','LineWidth',3);
xlabel('{\itt}/s');ylabel('{\itq}/rad');legend('Ideal position','PID');
