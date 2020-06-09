function index = randomDraw(T,lambda)
%RANDOMDRAW Similar to builtin `randi` but ensures unique samples returned
%
% index = sim.randomDraw(1000,10);
% index = sim.randomDraw(T,lambda);
%
% Inputs
%  T - Maximum integer value that can be returned. Creates uniform random
%      distribution that returns values on the closed interval [1,T]
%  lambda - Total number of unique integer values to be returned. Must be
%              less than or equal to T.
%
% Output
%  index - [1 by `lambda`] vector of unique integers on the closed interval
%           [1,T]

if lambda > T
   error(['SIM:' mfilename ':BadParameter'],...
      ['\n\t->\t<strong>[RANDOMDRAW]:</strong> ' ...
       '`lambda` is too large (%g) - algorithm will not converge.'],...
       lambda);
end

index = [];
vec = 1:T;

while numel(index) < lambda
   tmp = unique(vec(randi(numel(vec),1,lambda)));
   vec = setdiff(vec,tmp);
   index = [index, tmp]; %#ok<AGROW>
end

end