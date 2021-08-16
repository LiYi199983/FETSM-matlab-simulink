b=newfis('fuzz_smc2');

b=addvar(b,'input','s1',[-1,1]);
b=addmf(b,'input',1,'N','trapmf',[-1,-1,-0.02/100,0]);
b=addmf(b,'input',1,'Z','trimf',[-0.02/100,0,0.02/100]);
b=addmf(b,'input',1,'P','trapmf',[0,0.02/100,1,1]);

b=addvar(b,'output','Mu1',[0,1]);
b=addmf(b,'output',1,'Z','trimf',[0,0.00001,2]);
b=addmf(b,'output',1,'P','trapmf',[0,1,1,1]);


rulelist=[1 2 1 1;
          2 1 1 1;
          3 2 1 1];

b=addrule(b,rulelist);
showrule(b)                        

b1=setfis(b,'DefuzzMethod','lom'); 

writefis(b1,'fsmc2');              
b2=readfis('fsmc2');
ruleview(b2);

figure(1);
plotmf(b,'input',1);
figure(2);
plotmf(b,'output',1);