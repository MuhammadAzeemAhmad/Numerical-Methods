%%Hyperbolic Equation

L=1;
T=0.3;
dx=0.1;
dt=0.1;
alpha=1
x=0:dx:L
t=0:dt:T
lambda=alpha*dt/dx;
u=zeros(L/dx+1,round(T/dt+1))


u(:,1)=sin(2*pi*x);

u(1,:)=0
u(11,:)=0

dudt=2*pi*sin(2*pi*x)

u(2:10,2)=u(2:10,1)+transpose(dudt(2:10)*dt)

mat=zeros(L/dx-1,L/dx-1)
v=2*(1-lambda^2)*ones(L/dx-1,1);
mat1=diag(v);
v=lambda^2*ones(L/dx-2,1);
mat2=diag(v,1)
mat3=diag(v,-1)
mat=mat1+mat2+mat3

for tt=3:(T/dt+1)
    u(2:10,tt)=mat*u(2:10,tt-1)-u(2:10,tt-2)
end

for j=1:(T/dt+1)
    for i=1:(L/dx+1)
        Uanat(i,j)=sin(2*pi*x(i))*cos(2*pi*t(j))+sin(2*pi*t(j))
    end
end

plot(u)
