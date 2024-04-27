clc
disp("4C6 : Amit Singhal - 11614802722");
m_values=[0.5,1.5,-1.5]
s_values=[1,1.5,2]
for m=m_values 
for s=s_values 
t=grand (1,100,"nor",m,s); 
x=linspace(m-4*s,m+4*s,100); 
y=(1/(s*sqrt(2*%pi)))*exp(-(x-m).^2/(2*s^2));
plot(x,y); 
hold on; 
xgrid(); 
end 
end 
legend("m=0.5,s=1", "m=1.5,s=1.5", "m=-1.5,s=2"); 
xlabel("x"); 
ylabel("Probability Density Function");
title("Normal Distributions (for various parametric values)");
