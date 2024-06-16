clc
disp("4C6 : Amit Singhal - 11614802722")
printf("\n")

n = input("How many Workers & Jobs do you have :: ");
printf("\nEnter Time of -> \n\n");

for i = 1:n
    printf("------------------ Worker %d ------------------\n", i)
    for j = 1:n
        printf("Job %d", j);
        T(i,j) = input("");
    end
end

printf("\n--------------- DATA YOU ENTERED -------------\n");
printf("           ")
for i = 1:n
    printf("Job %d | ", i);
end

for i = 1:n
    printf("\nWorker %d | ", i);
    for j = 1:n
        printf("  %d   | ", T(i,j));
    end
end

minim = [1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000];
for i = 1:n
    for j = 1:n
        if(T(i,j) <= minim(i))
            minim(i) = T(i,j);
        end
    end
end

printf("\n");
for i = 1:n
    for j = 1:n
        T(i,j) = T(i,j) - minim(i);
    end
end

printf("\n\n------ Data after Row Minimum Decrement ------\n");
printf("           ")
for i = 1:n
    printf("Job %d | ", i);
end

for i = 1:n
    printf("\nWorker %d | ", i);
    for j = 1:n
        printf("  %d   | ", T(i,j));
    end
end

zerr = [1000, 1000, 1000, 1000, 1000, 1000];
zerc = [1000, 1000, 1000, 1000, 1000, 1000]; 
for i = 1:n
    for j = 1:n
        if(T(i,j) == 0)
            zerr(i) = 0;
            zerc(j) = 0;
        end
    end
end

f = 0;
y = 0;
for i = 1:n
    if(zerr(i))
        f = 1;
    end
end

for i = 1:n
    if(zerc(i))
        y = 1;
    end
end

if((f == 1) || (y == 1))
    mn = [1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000];
    for j = 1:n
        for i = 1:n
            if(T(i,j) <= mn(i))
                mn(j) = T(i,j);
            end
        end
    end
    
    for j = 1:n
        for i = 1:n
            T(i,j) = T(i,j) - mn(j);
        end
    end
    
    printf("\n\n---- Data after Column Minimum Decrement ----\n");
    printf("           ")
    for i = 1:n
        printf("Job %d | ", i);
    end

    for i = 1:n
        printf("\nWorker %d | ", i);
        for j = 1:n
            printf("  %d   | ", T(i,j));
        end
    end
end

printf("\n\n\n----------- Final job Assignment -------------\n");
for i = 1:n
    for j = 1:n
        if(T(i,j) == 0)
            printf("Assign Job %d to Worker %d\n", j, i);
            for z = 1:n
                if (z == i)
                    continue;
                end
                if(T(z,j) == 0)
                    T(z,j) = 1000;
                end
                for l = 1:n
                    if(l == j)
                        continue;
                    end
                    if (T(i,l) == 0)
                        T(i,l) = 1000;
                    end
                end
            end
        end
    end
end
