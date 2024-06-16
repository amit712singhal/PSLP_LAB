clc
disp("4C6 : Amit Singhal - 11614802722")

m=input("Enter the no. of rows of matrix :: ");
n=input("Enter the no. of coloumns of matrix :: ");
A=zeros(m,n);
B=zeros(m,n);

disp('Enter the elements of matrix row wise')
for i=1:m
    for j=1:n
        A(i,j)=input("");
    end
end

for i=1:n
    for j=1:m
        B(i,j)=A(j,i);
    end
end

disp("The matrix is ->")
disp(A)
disp("The transposed matrix is ->")
disp(B)
