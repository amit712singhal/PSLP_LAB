clc
disp("4C6 : Amit Singhal - 11614802722");
disp("Mean of the Distribution is")
m=input('/')
disp("Enter no. of Observations :: ")
n=input('/')
disp("Enter Values of X :: ")
for i=1:n
    X(1,i)=input('/')
end
disp("Enter Frequencies :: ")
for j=1:n 
    F(1,j)=input('/') 
end
for i=1:n
    P(1,i)=sum(F)*exp(-m)*m^(X(i))/factorial(X(i))
end
disp("Expected Frequencies ->")
disp(P)
plot2d(X,P)
