function [outputArg1,outputArg2] = improvement_operator(S, A)
% improvement
% S set of columns in a solution
% U set of uncovered rows
% w_j number of cols that cover row i
alpha = {};
beta = {};
[rows, cols] = size(A);
for i = 1:rows
    alpha{i} = find(A(i,:)==1);
end
for j = 1:cols
    beta{j} = find(A(:,j)==1);
end

for i = 1:rows
w(i) = size(intersect(alpha{i}, S));
end
T = S;
% Drop procecure
while ~isempty(T)
    j = datasample(T, 1);
    T = setdiff(T, j);
    if w(i)>2
        
    end
end

end
