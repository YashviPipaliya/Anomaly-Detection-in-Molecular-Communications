clc
close all
clear all

N = [1:160];

gammaU = 22.35;
gammaL = 19.65;

H1_max = 11;
H1_min = 21;

l1=10;
l2=20;
p =1;



x = poisscdf(N*H1_min + N*p, N*gammaU);
y = poisscdf(N*H1_max + N*p, N*gammaL);

pd_ac = (1-(x/2))+(y/2);


x1 = poisscdf(N*l2 + N*p,N*gammaU);
y1 = poisscdf(N*l1 + N*p,N*gammaL);

pf_ac = x1-y1;

Pe = 1/2*((1-pd_ac)+pf_ac);


plot(N,pf_ac);

xlabel('Number of Observations at ACs (N)','interpreter','latex')
ylabel('$P_F^{AC}$','interpreter','latex')

