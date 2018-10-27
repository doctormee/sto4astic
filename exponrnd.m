function [ res ] = exponrnd( lambda, varargin )
    if abs(nargin) < 1
        lambda = 1; % lambda
    end;
    if (lambda <= 0)
        disp('Error! Lambda must be > 0');
        res = [];
        return;
    end;
    res = - 1 ./ lambda * log(rand(varargin{:}, 1));
end

