clc
disp("4C6 : Amit Singhal - 11614802722")
printf("\n")
p=input("Enter number of varibles in the objective function :: ");
q=input("Enter number of constraint equations :: ");
disp('Enter coefficients of the objective function ->')
for i=1:p
    A(i)=input('\');
end
m=input("Enter 1 (to minimize) or 2 (to maximize) :: ");
disp('Enter constraint equations -> ')
for i=1:q
    disp('Enter ' + string(i)+ ' equation :: ')
    for j=1:p
        disp('Enter Coefficient ' + string(j))
        B(i,j)=input('\')
        if(j==p) then
            printf("whether you want to maximize or minimize this equation, Enter :: \n 1. for <= \n 2. for >=");
            C(i)=input('\');
            printf("Enter Constant");
            D(i)=input('\');
        end
    end
end
printf("\n\n The LPP is :: \n\n");
if(m==1) then
    printf("Minimized Equation ->\n");
else
    printf("Maximized Equation ->\n");
end 
for i=1:p
    if(i==p) then
        printf("%d%d", A(i),i);
    else
        printf("%dx%d + ",A(i),i);
    end
end
printf("\n")
printf("\nConstraint Equations are -> \n");
for i=1:q
    for j=1:p
        printf("%dx%d + ",B(i,j),j);
        if(j==p) then
            if(C(i)==1) then
                printf("<= %d",D(i));
            else if(C(i)) then
                    printf(">= %d",D(i));
                end
            end
        end
    end
    printf("\n");
end

printf("\n\n-----------IS SIMPLEX TABLE-----------\n\n");
printf(" CJ "); 
for i=1:p-1
    printf("%d", A(i));
end
for i=1:q-1
    printf(" 0s%d", i);
end
printf("\n---------------------------------------");
printf("\nBV Cb Хb [");
for i=1:p
    printf(" x%d",i); 
end
for i=1:q
    printf(" s%d",i);
end
printf(" Min Xb/x ]");
printf("\n---------------------------------------\n"); 
for i=1:p
    printf("s%d : 0 %d ",i,D(i));
    for j=1:q
        printf("%d ",B(i,j));
    end
    for j=1:q
        if(j==i) then
            printf("1 ");
        else
            printf("0 ");
        end
    end
    printf("\n");
end
printf("\n---------------------------------------");
printf("\n ZJ-CJ [ ");
for i=1:p
    printf("-%d ", A(i));
end
for i=1:q
    printf("0 ");
end
printf("] \n");
