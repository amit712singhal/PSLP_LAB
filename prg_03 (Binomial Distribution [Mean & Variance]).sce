clc
disp("4C6 : Amit Singhal - 11614802722");
disp("Enter no. of Observations :: ")
n=input('\')
disp("Enter Values of X :: ")
for i=1:n
    X(1,i)=input('\')
end
disp("Enter Frequencies :: ")
for j=1:n
    F(1,j)=input('\')
end
disp("Mean of the Distribution is ->")
MEAN=sum(F.*X)/sum(F)
disp(MEAN)
p=MEAN/n
v=n*p*(1-p)
disp("The Variance is ->")
disp(v)
EF=sum(F)*binomial(p,n-1)
disp("Given Frequencies ->")
disp(F)
disp("Expected Frequencies ->")
disp(EF)
plot2d3(0:n-1,F)
plot2d(0:n-1,EF)
