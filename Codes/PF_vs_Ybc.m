clc
close all
clear all
M=30;
%Pf_ac=0.0001:0.001:0.1;
e=100;
Y_bc_thr=[0:1:30];
%Y_bc_thr=5;
lambda=[0:0.1:1];
lambda_bar=0.003;


for m=1:M
    Pf_ac=0.0001;
    m_n=m*lambda_bar+5;
    i=1;
    pf = (nCk(30,m)/factorial(m)).*((1-Pf_ac(i)).^(30-m)).*(Pf_ac(i)).^m;
   
    p=(1-(gammainc(Y_bc_thr,m_n)))/(factorial(Y_bc_thr(m)));
 
   z=p.*pf ;
    i=i+1;  
  %plot(Y_bc_thr,z);  ...
   
end


for m=1:M
    Pf_ac=0.001;
    m_n=m*lambda_bar+5;
    i=1;
    pf = (nCk(30,m)/factorial(m)).*((1-Pf_ac(i)).^(30-m)).*(Pf_ac(i)).^m;
   
    p=(1-(gammainc(Y_bc_thr,m_n)))/(factorial(Y_bc_thr(m)));
 
   z1=p.*pf ;
    i=i+1;    ...
   %plot(Y_bc_thr,z1);
end


for m=1:M
    Pf_ac=0.01;
    m_n=m*lambda_bar+5;
    i=1;
    pf = (nCk(30,m)/factorial(m)).*((1-Pf_ac(i)).^(30-m)).*(Pf_ac(i)).^m;
   
    p=(1-(gammainc(Y_bc_thr,m_n)))/(factorial(Y_bc_thr(m)));
 
   z2=p.*pf ;
    i=i+1; 
 %plot(Y_bc_thr,z2);   ...
   
end


for m=1:M
    Pf_ac=0.1;
   % Y_bc_thr=[0:3:30];
    m_n=m*lambda_bar+5;
    i=1;
    pf = (nCk(30,m)/factorial(m)).*((1-Pf_ac(i)).^(30-m)).*(Pf_ac(i)).^m;
   
    p=(1-(gammainc(Y_bc_thr,m_n)))/(factorial(Y_bc_thr(m)));
 
   z3=p.*pf ;
    i=i+1;    
  %  plot(Y_bc_thr,z3);...
   
end

plot(Y_bc_thr,z);
hold on;
plot(Y_bc_thr,z1);
hold on;
plot(Y_bc_thr,z2,'k');
hold on;
plot(Y_bc_thr,z3);
hold on;
grid on;
axis ([ 0 30 0 1.1])

legend('$P_F^{AC} = 10^{-4}$','$P_F^{AC} = 10^{-3}$','$P_F^{AC} = 10^{-2}$','$P_F^{AC} = 10^{-1}$','interpreter','latex')
xlabel('$y_{BC}^{THR}$','interpreter','latex')
ylabel('$P_F$','interpreter','latex')


function C = nCk(n,k)
% use smaller k if available
k(k>n/2) = n-k(k>n/2);
k = k(:);
kmat = ones(numel(k),1)*(1:max(n-k));
kmat = kmat.*bsxfun(@le,kmat,(n-k));
pw = bsxfun(@power,kmat,-1./(n-k));
pw(kmat==0) = 1;
kleft = ones(numel(k),1)*(min(k):n);
kleft = kleft.*bsxfun(@gt,kleft,k);
t = bsxfun(@times,kleft,prod(pw,2));
t (kleft==0) = 1;
C = prod(t,2);

end