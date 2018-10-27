function [res] = devil(x, value, left, right)
% This function returns vector of values of devil staircase with maximal
% value val, defined on [left, right] for vector x
    res = [];
    if isempty(x)
        return;
    end
    if (left > right)
        disp('Wrong limits!');
        return;
    end
    if sum((x > right) + (x < left)) ~= 0
        disp('Error! X is out of limits!');
        return;
    end
    middle = (value ./ 2); %the middle value 
    third = (right - left) ./ 3;
    if length(x) == 1
        res = double(middle * (x >= left + third)  + middle * (x > right - third));
    end
    recLeft = devil(x(x < (left + third)), value ./ 2, left, left + third);
    recRight = devil(x(x > (right - third)), value ./ 2, right - third, right);
    res = repmat(middle, size(x));
    res(x < (left + third)) = recLeft;
    res(x > (right - third)) = recRight + middle;
end