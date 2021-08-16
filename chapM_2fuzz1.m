a=newfis('fuzz_smc1');

a=addvar(a,'input','s1',[-1,1]);
a=addmf(a,'input',1,'N','trapmf',[-1,-1,-0.02/100,0]);
a=addmf(a,'input',1,'Z','trimf',[-0.02/100,0,0.02/100]);
a=addmf(a,'input',1,'P','trapmf',[0,0.02/100,1,1]);

a=addvar(a,'output','Mu1',[0,1]);

a=addmf(a,'output',1,'Z','trimf',[0,0.00001,2]);
a=addmf(a,'output',1,'P','trapmf',[0,1,1,1]);



rulelist=[1 2 1 1;
          2 1 1 1;
          3 2 1 1];

a=addrule(a,rulelist);
showrule(a)                        

a1=setfis(a,'DefuzzMethod','lom'); 
 
writefis(a1,'fsmc1');              
a2=readfis('fsmc1');
ruleview(a2);

figure(1);
plotmf(a,'input',1);
figure(2);
plotmf(a,'output',1);