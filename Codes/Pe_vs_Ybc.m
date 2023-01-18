clear all;
close all;
y_BC = [0:30];
s = [10:10:50];
L=5;
time_slot = [1:5];
lambdaBC = 10;
m = 30*9*(10^-6);
r = 45*(10^-9);
d = 500*(10^-9);
D = 4.265*(10^-10);


for i = 1:length(time_slot)
    P_i1(i) = (r/d)*(erfc((d-r)/sqrt(4*D*i*m))-erfc((d-r)/sqrt(4*D*(i-1)*m)));
    ntx(i) = 2*lambdaBC*m*10^(s(i)/10)/P_i1(1);
end
for j = 1:length(time_slot)
    cj(j) = ntx(j)*P_i1(j);

sj = randi([0, 1], 1, j);

for i = 1:length(y_BC)
    P_e(i) = (0.5*(gammainc((lambdaBC*m + sum(sj.*cj)), y_BC(i)) + 1 - gammainc((lambdaBC*m + sum(sj.*cj) + cj(1)), y_BC(i))));
end
end

P_ey_BC = (P_e)/(2^L);
plot(y_BC, P_e,'r');



xlabel('$ y_{BC}^{mHR} $','interpreter','latex')
ylabel('Pe')




