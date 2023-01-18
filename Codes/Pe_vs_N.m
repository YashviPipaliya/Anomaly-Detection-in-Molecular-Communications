clc
close all
clear all

%N = [5 10 20 40 80 160];
%N = [1:1:5];
N = [1:160];
%N=160;
%gammaU=[20:30];
gammaU = 22.35;
gammaL = 19.65;
%gammaU = 0.1;
%gammaL = 0.1;
H1_max = 11;
H1_min = 21;
%H1_max = [10.5:12];
%H1_min = [20.5:22];
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


plot(N,Pe);

xlabel('Number of Observations at ACs (N)','interpreter','latex')
ylabel('$Pe$','interpreter','latex')

