function [U x t] = Crank_Nicolson(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2)
s = c*(k/(h^2));            %lambda = k/h^2;

x = [a_x:h:b_x];            %Discretize space
t = [a_t:k:b_t];            %Discretize time range
n = length(t);
m = length(x);
U = zeros(n,m);
U(1,:) = ic(x);
%U(t,x)
%(2I + sB)U(j,:) = (2I-sB)U(j-1,:)
B = zeros(m,m);
B(1,1) = 2;
B(1,2) = -1;
B(m,m-1) = -1;
B(m,m) = 2;
for i = 2:m-1
    B(i,i-1) = -1;
    B(i,i) = 2;
    B(i,i+1) = -1;
end
U = U';
for j = 2:n
   U(1,j-1) = bc_1(t(j-1));
   U(m,j-1) = bc_2(t(j-1));
   U(:,j) = (2*eye(m,m) + s*B)\(2*eye(m,m) - s*B)*U(:,j-1); 
end
U(1,n) = bc_1(t(n));
U(m,n) = bc_2(t(n));
U = U';
end