function [U x t] = btcs(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2)
s = c*(k/(h^2));            %lambda = k/h^2;

x = [a_x:h:b_x];            %Discretize space
t = [a_t:k:b_t];            %Discretize time range
n = length(t);
m = length(x);
U = zeros(n,m);
U(1,:) = ic(x);
%U(t,x)
%AU(j,:) = AU(j-1,:)
A = zeros(m,m);
A(1,1) = 1+2*s;
A(1,2) = -s;
A(m,m-1) = -s;
A(m,m) = 1+2*s;
for i = 2:m-1
    A(i,i-1) = -s;
    A(i,i) = 1+2*s;
    A(i,i+1) =  -s;
end
U = U';
for j = 2:n
   U(1,j-1) = bc_1(t(j-1));
   U(m,j-1) = bc_2(t(j-1));
   U(:,j) = A\U(:,j-1); 
 
end
U(1,n) = bc_1(t(n));
U(m,n) = bc_2(t(n));
U = U';
end