k1=y1(:,3)-y1(:,1);
k2=y1(:,4)-y1(:,2);
y=[1:100:10255,10256];
k11=k1(y);
k21=k2(y);
k11=abs(k1(y));
k21=abs(k2(y));
t=[0:0.1:10.2,10.255];
figure(1)%joint 1
plot(t,e1,'-','color','b','markersize',15);hold on;
plot(t,e11,':','color','r','markersize',20);
plot(t,e111,'-.','color','g','markersize',10);
plot(t,e1111,'--','color','m','markersize',15);
xlabel('{\itt}/s');ylabel('{\ite}/rad');legend('FETSM','ETSM','ESM','PID');
figure(2)%joint 2
plot(t,e2,'-','color','b','markersize',10);hold on;
plot(t,e22,':','color','r','markersize',10);
plot(t,e222,'-.','color','g','markersize',10);
plot(t,e2222,'--','color','m','markersize',10);
xlabel('{\itt}/s');ylabel('{\ite}/rad');legend('FETSM','ETSM','ESM','PID');
