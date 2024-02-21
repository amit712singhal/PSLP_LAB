clc
disp("4C6 : Amit Singhal - 11614802722")

m=input("Enter the no. of rows of matrix :: ");
n=input("Enter the no. of coloumns of matrix :: ");
A=zeros(m,n);
B=zeros(m,n);
C=zeros(m,n);

disp("Enter the elements of Ist matrix row wise")
for i=1:m
    for j=1:n
        A(i,j)=input("");
    end
end

disp("Enter the elements of IInd matrix row wise")
for i=1:m
    for j=1:n
        B(i,j)=input("");
    end
end
for i=1:m
    for j=1:n
        C(i,j)=A(i,j)+B(i,j);
    end
end

disp("The Ist matrix is ->")
disp(A)
disp("The IInd matrix is ->")
disp(B)
disp("The sum of matrices is ->")
disp(C)
