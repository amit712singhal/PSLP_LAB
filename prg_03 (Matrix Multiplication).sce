clc
disp("4C6 : Amit Singhal - 11614802722")

m=input("Enter the no. of rows of Ist matrix :: ");
n=input("Enter the no. of coloumns of Ist matrix :: ");
p=input("Enter the no. of rows of IInd matrix :: ");
q=input("Enter the no. of coloumns of IInd matrix :: ");

if n==p
    disp('Matrices are comfortable for multiplication');
else
    disp('Matrices are not comfortable for multiplication');
    break;
end

A=zeros(m,n);
B=zeros(p,q);
C=zeros(m,q);

disp("Enter the elements of Ist matrix row wise")
for i=1:m
    for j=1:n
        A(i,j)=input("");
    end
end

disp("Enter the elements of IInd matrix row wise")
for i=1:p
    for j=1:q
        B(i,j)=input("");
    end
end

for i=1:m
    for j=1:q
        for k=1:n
            C(i,j)=C(i,j)+A(i,k)*B(k,j);
        end
    end
end

disp("The Ist matrix is ->")
disp(A)
disp("The IInd matrix is ->")
disp(B)
disp("The product of matrices is ->")
disp(C)
