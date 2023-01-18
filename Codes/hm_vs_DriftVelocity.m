clear all
vm=0:1:10;
lm=1;
k=1;
w=1;
delta=0.5;
sigmam=delta/2;
lambdam=((lm)^2)/sigmam;


%part 1


l=2.*(1/sqrt(k)).*(k.*vm-1);
m=(-2).*(1/sqrt(k)).*(k.*vm+1);
n=exp(8*vm);
z1 = normcdf(l);
z2 = normcdf(m);

F1 = z1 + n.*z2;

k1=k-1;
l1=2.*(1/sqrt(k1)).*(k1.*vm-1);
m1=(-2).*(1/sqrt(k1)).*(k1.*vm+1);
n1=exp(8*vm);
z11 = normcdf(l1);
z21 = normcdf(m1);

F12 = z11 + n.*z21;

z3 = phi(1/0);
F2 = z3 + n.*z3;

F3 = F1 - F2;
plot(vm,F3);
hold on;



for i=0:3
k=k+1;    
l=2.*(1/sqrt(k)).*(k.*vm-1);
m=(-2).*(1/sqrt(k)).*(k.*vm+1);
n=exp(8*vm);
z1 = normcdf(l);
z2 = normcdf(m);

F1 = z1 + n.*z2;

k1=k-1;
l1=2.*(1/sqrt(k1)).*(k1.*vm-1);
m1=(-2).*(1/sqrt(k1)).*(k1.*vm+1);
n1=exp(8*vm);
z11 = normcdf(l1);
z21 = normcdf(m1);

F12 = z11 + n.*z21;

z3 = phi(1/0);
F2 = z3 + n.*z3;

F31 = F1 - F12;
F3 = F1 - F2;


plot(vm,F31);
hold on;
  
legend('$h_m [n,1]$','$h_m [n,2]$','$h_m [n,3]$','$h_m [n,4]$','$h_m [n,5]$','interpreter','latex')
xlabel('$v_m[m/sec]$','interpreter','latex')
ylabel('$h_m [n,l]$','interpreter','latex')
  
end



function p = phi(z)
    p = 1/2.*(erfc(z/(sqrt(2))));
end

