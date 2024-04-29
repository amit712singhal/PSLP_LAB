clc
disp("4C6 : Amit Singhal - 11614802722")

prices = [1, 2, 3; 8, 5, 4; 3, 1, 6];
demand = [100, 30, 70];
supply = [110, 40, 50];

prices = evstr(x_matrix('setprices', prices));
demand = evstr(x_matrix('setdemand', demand));
supply = evstr(x_matrix('submit offer', supply));

LEFT = 1;
RIGHT = 2;
UP = 3;
DOWN = 4;

function res = cost(prices, plan)
    cntCols = length(prices(1,:));
    cntRows = length(prices(:,1));
    res = 0;
    for i = 1:cntRows
        for j = 1:cntCols
            res = res + prices(i,j) * plan(i,j);
        end
    end
end

function [corners, success] = getAvailableCorner(basis, direction, initialPoint, i, j)
    success = 0;
    corners = [];
    currentCorner = 1;
    cntCols = length(basis(1, :));
    cntRows = length(basis(:, 1));
    colModificator = 0;
    rowModificator = 0;
    if direction == LEFT
        colModificator = -1;
    end
    if direction == RIGHT
        colModificator = 1;
    end
    if direction == UP
        rowModificator = -1;
    end
    if direction == DOWN
        rowModificator = 1;
    end
    i = i + rowModificator;
    j = j + colModificator;
    while (i ~= 0 && j ~= 0 && i <= cntRows && j <= cntCols)
        if (basis(i,j) ~= 0 || [i, j] == initialPoint)
            corners(currentCorner, :) = [i, j];
            currentCorner = currentCorner + 1;
            success = 1;
        end
        i = i + rowModificator;
        j = j + colModificator;
    end
    if success == 1
        cornersReverse = [];
        for iter = 1:length(corners(:, 1))
            cornersReverse(iter, :) = corners(length(corners(:, 1)) - iter + 1, :);
        end
        corners = cornersReverse;
    end
end

function [nodes, success] = buildCycle(basis, initialPoint, currentPoint, direction)
    success = 0;
    nodes = [];
    possibleDirections = [];
    if initialPoint == currentPoint
        possibleDirections = [LEFT, RIGHT, UP, DOWN];
    elseif direction == LEFT || direction == RIGHT
        possibleDirections = [UP, DOWN];
    elseif direction == UP || direction == DOWN
        possibleDirections = [LEFT, RIGHT];
    end
    for directionIdx = 1:length(possibleDirections)
        [corners, suc] = getAvailableCorner(basis, possibleDirections(directionIdx), initialPoint, currentPoint(1), currentPoint(2));
        if suc == 1
            possibleToCloseCycle = 0;
            successWithCorners = 0;
            for cornIdx = 1:length(corners(:, 1))
                if isequal(corners(cornIdx, :), initialPoint)
                    possibleToCloseCycle = 1;
                    continue;
                end
                [subNodes, suc] = buildCycle(basis, initialPoint, corners(cornIdx, :), possibleDirections(directionIdx));
                if suc == 1
                    successWithCorners = 1;
                    nodeIdx = 1;
                    nodes(nodeIdx, :) = currentPoint;
                    for subNodeIdx = 1:length(subNodes(:, 1))
                        nodeIdx = nodeIdx + 1;
                        nodes(nodeIdx, :) = subNodes(subNodeIdx, :);
                    end
                    break;
                end
            end
            if successWithCorners == 1
                success = 1;
                break;
            elseif possibleToCloseCycle == 1
                nodes(1, :) = currentPoint;
                nodes(2, :) = initialPoint;
                success = 1;
                break;
            end
        end
    end
end

cntCols = length(prices(1, :));
cntRows = length(prices(:, 1));
plan = zeros(cntRows, cntCols);

tempDemand = demand;
tempSupply = supply;

for j = 1:cntCols
    for i = 1:cntRows
        currentSupply = min(tempDemand(j), tempSupply(i));
        plan(i, j) = currentSupply;
        tempDemand(j) = tempDemand(j) - currentSupply;
        tempSupply(i) = tempSupply(i) - currentSupply;
        if tempDemand(j) == 0
            break;
        end
    end
end

disp("Initial plan:");
disp(plan);
printf("\nThe cost is %d Nf.Du.\n\n\n", cost(prices, plan));

optimal = 0;
UNKNOWN_POTENTIAL = -9999999;
iteration = 0;

while ~optimal
    iteration = iteration + 1;
    potencialU = zeros(1, cntRows);
    potencialV = zeros(1, cntCols);
    potencialU(1) = 0;
    continuePotentialing = 1;

    while continuePotentialing
        continuePotentialing = 0;
        for j = 1:cntCols
            for i = 1:cntRows
                if plan(i, j) == 0
                    if potencialU(i) == UNKNOWN_POTENTIAL
                        continuePotentialing = 1;
                        continue;
                    elseif potencialV(j) == UNKNOWN_POTENTIAL
                        continuePotentialing = 1;
                        continue;
                    end
                    if potencialU(i) == UNKNOWN_POTENTIAL
                        potencialU(i) = prices(i, j) - potencialV(j);
                    end
                    if potencialV(j) == UNKNOWN_POTENTIAL
                        potencialV(j) = prices(i, j) - potencialU(i);
                    end
                end
            end
        end
    end
    
    notBasis = zeros(cntRows, cntCols);
    optimal = 1;
    maxI = 0;
    maxJ = 0;
    maxNB = 0;
    
    for j = 1:cntCols
        for i = 1:cntRows
            if plan(i, j) == 0 then
                continue
            end
            notBasis(i, j) = potencialU(i) + potencialV(j) - prices(i, j);
            if notBasis(i, j) > 0 then
                optimal = 0;
                if maxNB < notBasis(i, j)
                     maxNB = notBasis(i, j);
                     maxI = i;
                     maxJ = j;
                end
             end
        end
    end
      
    if optimal == 1 then
        printf("Iteration %d. The current plan is optimal!", iteration);
        break;
    else
        printf("Iteration %d. Current plan is not optimal. Plan optimization", iteration);
    end
    
    [nodes, success] = buildCycle(plan, [maxI, maxJ], [maxI, maxJ], "");
    
    if success == 0 then
        disp("Loop building error. Shutdown");
        break;
    end
    
    minNode-99999999;
    
    for node = 2:2:length(nodes(:, 1))
        if minNode > plan(nodes(node, 1), nodes(node, 2)) then
            minNode = plan(nodes(node, 1), nodes(node, 2));
        end
    end
    
    for node = 2:length(nodes(:, 1))
        nodeI = nodes(node, 1);
        nodeJ = nodes(node, 2);
        if modulo(node, 2) == 0 then
            plan(nodeI, nodeJ) = plan(nodeI, nodeJ) - minNode; //Subtract min for even nodes
        else
            plan(nodeI, nodeJ) = plan(nodeI, nodeJ) + minNode; //Add min for odd nodes
        end
    end
    
    disp("New plan:");
    disp(plan);
    printf("\nThe cost is %d N/.Du.\n\n\n", cost(prices, plan));
end
    
tableStr = 2;
table = []
table(1, :) = ["From supplier" "To the consumer" "Quantity"]
    
for i = 1:cntRows
    for j = 1:cntCols
        if plan(i, j) ~= 0 then
            str = []
            str(1:3)=string([i,j,plan(i,j)])
            table(tableStr, :) = str
            tableStr = tableStr + 1;
        end
    end
end
    
disp(table);
    
f = createWindow();
f.figure_size = [400 400];
f.figure_name = "Final answer";
as = f.axes_size;
ut = uicontrol("style", "table", ...
                "string", table, ...
                "position", [20, 20, 360, 360], ...
                "tag", "Final answer");
matrix(ut.string, size(table));
