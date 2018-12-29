Q = [7,	8,	10,	9;	
    5,	6,	7,	14;	
    11,	7,	6,	12;	
    10,	11,	9,	4];
B = [max(Q(:, 1)), max(Q(:, 2)),max(Q(:, 3)),max(Q(:, 4))];
for j = 1:4
    for i = 1:4
        R(i, j) = B(j)-Q(i, j);
    end
end
Vald_1 = [min(Q(1,:)), min(Q(2,:)), min(Q(3,:)), min(Q(4,:))];
Vald_2 = max(Vald_1);
Vald = find(Vald_1==Vald_2);

Savg_1 = [max(R(1,:)), max(R(2,:)), max(R(3,:)), max(R(4,:))];
Savg_2 = min(Savg_1);
Savg = find(Savg_1==Savg_2);

H = 0.6;
for i = 1:size(Q, 2)
    maxGu(i) = max(Q(i,:));
    minGu(i) = min(Q(i,:));    
end

for i = 1:size(Q, 2)
    C(i) = H*minGu(i) + (1-H)*maxGu(i);
end
Gurv = find(C==max(C));

for i = 1:size(Q, 2)
    dLapl(i) = (1/size(Q, 2))*sum(Q(i,:));
end

Lapl = find(dLapl==max(dLapl));
res = zeros(4,4);

res(Vald, 1) = 1;
res(Savg, 2) = 1;
res(Gurv, 3) = 1;
res(Lapl, 4) = 1;
 
summ = [sum(res(1,:)), sum(res(2,:)), sum(res(3,:)), sum(res(4,:))];
res
answ = find(summ == max(summ))