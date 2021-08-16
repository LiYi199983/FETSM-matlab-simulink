function [sys,x0,str,ts]=s_function(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 3,
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys = [];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 6;
sizes.NumInputs      = 4;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys=simsizes(sizes);
x0=[];
str=[];
ts=[];
function sys=mdlOutputs(t,x,u)
persistent a2;
persistent b2;
if t==0
    a2=readfis('fsmc1.fis');
    b2=readfis('fsmc2.fis');
end
e(1)=u(1);e(2)=u(2);
de(1)=u(3);de(2)=u(4);

tnode=[0	2.380632392	3.505666959	4.275059855	6.612705584	7.88863381	10.25572392];

curve1=[0.001998939	-0.00969027	-6.76E-17	0	-0.34906585
-0.001673717	0.025282709	-0.12488671	0.198206232	-0.467029894
-0.000231492	0.005058859	-0.018539585	-0.050338837	-0.249200835
-0.002885392	0.050441185	-0.309557826	0.779074762	-1.13564903
0.014699294	-0.41468823	4.304087995	-19.56004623	32.48850571
-0.009354817	0.344328089	-4.677314702	27.67395176	-60.66442266];

curve2=[-0.003220844	0.015607104	6.76E-17	0	0.34906585
0.007050914	-0.082206011	0.349285605	-0.554347084	0.678990006
-0.011627037	0.179708689	-1.027992961	2.664506224	-2.142066916
0.004386156	-0.094120744	0.727962863	-2.340037942	3.206614549
-0.008472244	0.2459945	-2.645660091	12.53247896	-21.38027934
0.003219462	-0.122931833	1.719827019	-10.42600718	23.89749316];

if t>=tnode(1)&&t<=tnode(2)
    Man(1)=curve1(1,:)*[t^4,t^3,t^2,t,1]';
    Man(2)=curve2(1,:)*[t^4,t^3,t^2,t,1]';
    dMan(1)=polyder(curve1(1,:))*[t^3,t^2,t,1]';
    dMan(2)=polyder(curve2(1,:))*[t^3,t^2,t,1]';
    ddMan(1)=polyder(polyder(curve1(1,:)))*[t^2,t,1]';
    ddMan(2)=polyder(polyder(curve2(1,:)))*[t^2,t,1]';
end
if t>=tnode(2)&&t<=tnode(3)
    Man(1)=curve1(2,:)*[t^4,t^3,t^2,t,1]';
    Man(2)=curve2(2,:)*[t^4,t^3,t^2,t,1]';
    dMan(1)=polyder(curve1(2,:))*[t^3,t^2,t,1]';
    dMan(2)=polyder(curve2(2,:))*[t^3,t^2,t,1]';
    ddMan(1)=polyder(polyder(curve1(2,:)))*[t^2,t,1]';
    ddMan(2)=polyder(polyder(curve2(2,:)))*[t^2,t,1]';
end
if t>=tnode(3)&&t<=tnode(4)
    Man(1)=curve1(3,:)*[t^4,t^3,t^2,t,1]';
    Man(2)=curve2(3,:)*[t^4,t^3,t^2,t,1]';
    dMan(1)=polyder(curve1(3,:))*[t^3,t^2,t,1]';
    dMan(2)=polyder(curve2(3,:))*[t^3,t^2,t,1]';
    ddMan(1)=polyder(polyder(curve1(3,:)))*[t^2,t,1]';
    ddMan(2)=polyder(polyder(curve2(3,:)))*[t^2,t,1]';
end
if t>=tnode(4)&&t<=tnode(5)
    Man(1)=curve1(4,:)*[t^4,t^3,t^2,t,1]';
    Man(2)=curve2(4,:)*[t^4,t^3,t^2,t,1]';
    dMan(1)=polyder(curve1(4,:))*[t^3,t^2,t,1]';
    dMan(2)=polyder(curve2(4,:))*[t^3,t^2,t,1]';
    ddMan(1)=polyder(polyder(curve1(4,:)))*[t^2,t,1]';
    ddMan(2)=polyder(polyder(curve2(4,:)))*[t^2,t,1]';
end
if t>=tnode(5)&&t<=tnode(6)
    Man(1)=curve1(5,:)*[t^4,t^3,t^2,t,1]';
    Man(2)=curve2(5,:)*[t^4,t^3,t^2,t,1]';
    dMan(1)=polyder(curve1(5,:))*[t^3,t^2,t,1]';
    dMan(2)=polyder(curve2(5,:))*[t^3,t^2,t,1]';
    ddMan(1)=polyder(polyder(curve1(5,:)))*[t^2,t,1]';
    ddMan(2)=polyder(polyder(curve2(5,:)))*[t^2,t,1]';
end
if t>=tnode(6)&&t<=tnode(7)
    Man(1)=curve1(6,:)*[t^4,t^3,t^2,t,1]';
    Man(2)=curve2(6,:)*[t^4,t^3,t^2,t,1]';
    dMan(1)=polyder(curve1(6,:))*[t^3,t^2,t,1]';
    dMan(2)=polyder(curve2(6,:))*[t^3,t^2,t,1]';
    ddMan(1)=polyder(polyder(curve1(6,:)))*[t^2,t,1]';
    ddMan(2)=polyder(polyder(curve2(6,:)))*[t^2,t,1]';
end
p=1;q=1;%FETSM and ETSM :p=5,q=3.  ESM:p=1,q=1
B=[1,0;0,1];
for i=1:size(e,2)
x1(i)=Man(i)-e(i);
x2(i)=dMan(i)-de(i);
s(i)=e(i)+B(i,i)*(abs(de(i)))^(p/q)*sign(de(i));
end
M=[];C=[];G=[];
r1=1;r2=0.8;m1=2;m2=2;g=9.8;
M(1,1)=(m1+m2)*r1^2+m2*r2^2+2*m2*r1*r2*cos(x1(2));
M(1,2)=m2*r2^2+m2*r1*r2*cos(x1(2));
M(2,1)=M(1,2);
M(2,2)=m2*r2^2;
C(1,1)=-m2*r1*sin(x1(2))*x2(2);
C(1,2)=-m2*r1*sin(x1(2))*(x2(1)+x2(2));
C(2,1)=m2*r1*sin(x1(2))*x1(1);
C(2,2)=0;
G(1,1)=(m1+m2)*r1*cos(x1(2))+m2*r2*cos(x1(1)+x1(2));
G(1,2)=m2*r2*cos(x1(1)+x1(2));
for i=1:size(e,2)
de(i)=abs(de(i))^(2-p/q)*sign(de(i));
end
Teq=C*x2'+G'*g+M*((q/p)*B*de'+ddMan');
cho=2;%FETSM:cho=1. ETSM and ESM:cho=2.
Mu=[0,0;
    0,0];
if cho==1
    Mu(1,1)=evalfis([s(1)],a2);
    Mu(2,2)=evalfis([s(2)],b2);
elseif cho==2
    Mu=[1,0;
        0,1];
end
Tsw=Mu*[10.2,0;0,2.2]*sign(s');
T=Teq+Tsw;
sys(1)=T(1);
sys(2)=T(2);
sys(3)=Mu(1,1);
sys(4)=Mu(2,2);
sys(5)=s(1);
sys(6)=s(2);
