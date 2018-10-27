function [ res ] = geomrnd( p, varargin )
    n = 100; %number of bernulli trials (for a start)
    bernMat = bernrnd(p, n, varargin{:});
    while ~isempty(find(any(bernMat) == 0))
        n = n * 10; %need more trials
        bernMat = bernrnd(p, n, varargin{:});
    end
    [~, res] = max( bernMat ~=0, [], 1 );
    res = res - 1;
    sz = [varargin{:}];
    if nargin < 3
        sz = [sz, 1]; %not enough dimensions 
    end
    res = reshape(res, sz);
end

