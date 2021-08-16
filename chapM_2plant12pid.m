function [sys,x0,str,ts]=s_function(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys = [];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 4;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 4;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 0;
sys=simsizes(sizes);
x0=[0.02,0.52,0,0];
str=[];
ts=[];
function sys=mdlDerivatives(t,x,u)
M=[];C=[];G=[];
r1=1;r2=0.8;m1=2;m2=2;g=9.8;
M(1,1)=(m1+m2)*r1^2+m2*r2^2+2*m2*r1*r2*cos(x(2));
M(1,2)=m2*r2^2+m2*r1*r2*cos(x(2));
M(2,1)=M(1,2);
M(2,2)=m2*r2^2;
C(1,1)=-m2*r1*sin(x(2))*x(4);
C(1,2)=-m2*r1*sin(x(2))*(x(3)+x(4));
C(2,1)=m2*r1*sin(x(2))*x(1);
C(2,2)=0;
G(1,1)=(m1+m2)*r1*cos(x(2))+m2*r2*cos(x(1)+x(2));
G(1,2)=m2*r2*cos(x(1)+x(2));
D=[10*exp(-2*(t-5)^2);2*exp(-0.5*(t-5)^2)];
X=inv(M)*([u(1);u(2)]-C*[x(3);x(4)]-G'*g-D);

sys(1)=x(3);%误差导数关节1
sys(2)=x(4);%误差导数关节2
sys(3)=X(1);
sys(4)=X(2); 

function sys=mdlOutputs(t,x,u)
D=[10*exp(-2*(t-5)^2);2*exp(-0.5*(t-5)^2)];
sys(1)=x(1);
sys(2)=x(2);
sys(3)=x(3);
sys(4)=x(4);
