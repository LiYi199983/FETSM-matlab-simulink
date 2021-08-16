k1=y1(:,3);
k2=y1(:,4);
p1=y1(:,1);
p2=y1(:,2);
y=[1:100:10255,10256];
p10=p1(y);
p20=p2(y);
k11=k1(y);
k21=k2(y);
t=[0:0.1:10.2,10.255];
figure(1)
plot(t,p10,'-','color','k','markersize',5);hold on;
plot(t,e1,':','color','b','markersize',15);
plot(t,e1111,'-.','color','m','markersize',15);
xlabel('{\itt}/s');ylabel('{\itq}/rad');legend('Ideal position','FETSM','PID');
figure(2)
plot(t,p10,'-','color','k','markersize',20);hold on;
plot(t,e11,':','color','r','markersize',20);
plot(t,e111,'-.','color','g','markersize',10);
xlabel('{\itt}/s');ylabel('{\itq}/rad');legend('Ideal position','ETSM','ESM');
figure(3)
plot(t,p20,'-','color','k','markersize',20);hold on;
plot(t,e2,':','color','b','markersize',10);
plot(t,e2222,'-.','color','m','markersize',10);
xlabel('{\itt}/s');ylabel('{\itq}/rad');legend('Ideal position','FETSM','PID');
figure(4)
plot(t,p20,'-','color','k','markersize',20);hold on;
plot(t,e22,':','color','r','markersize',10);
plot(t,e222,'-.','color','g','markersize',10);
xlabel('{\itt}/s');ylabel('{\itq}/rad');legend('Ideal position','ETSM','ESM');