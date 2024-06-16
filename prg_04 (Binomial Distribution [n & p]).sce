clc
disp("4C6 : Amit Singhal - 11614802722")
disp("Enter no. of observations ->");
n=input('\');
disp("Enter value of p ->");
p=input('\');
disp("Enter values of x ->");
for i=1:n
X(1,i)=input('\');
end
disp("Enter values of f(frequency) ->");
for j=1:n
F(1,j)=input('\');
end
EF=sum(F)*binomial(p,n-1);
disp("x (Observations)");
disp(X);
disp("f (Frequencies)");
disp(F);
disp("EF (Expected Frequencies)");
disp(EF);
plot2d3(0:n-1,F);
plot2d(0:n-1,EF);
