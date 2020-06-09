function varargout = experiment(varargin)
%EXPERIMENT  Default parameters for simulation experiments
%
%  param = default.experiment('paramName');
%  [p1,p2,...,pk] = default.experiment('p1','p2','p3',...,'pk');
%
%  Unlikely to change (based on paper)
%  -> 'L': (def: 30) maximum correlation offset (ms)
%  -> 'w': (def: 1) histogram bin width (ms)
%  -> 'J': (def: 100) total number of surrogates

p = struct;
% Unlikely to change
p.L = 30;   % ms (from paper  --  maximum correlation offset)
p.w =  1;   % ms (from paper  --  histogram bin width)
p.J = 100;  % # surrogates

% % Parse Input/Output % %
if nargin < 1
   varargout = {p};   
else
   F = fieldnames(p);   
   if (nargout == 1) && (numel(varargin) > 1)
      varargout{1} = struct;
      for iV = 1:numel(varargin)
         idx = strcmpi(F,varargin{iV});
         if sum(idx)==1
            varargout{1}.(F{idx}) = p.(F{idx});
         end
      end
   elseif nargout > 0
      varargout = cell(1,nargout);
      for iV = 1:nargout
         idx = strcmpi(F,varargin{iV});
         if sum(idx)==1
            varargout{iV} = p.(F{idx});
         end
      end
   else
      for iV = 1:nargin
         idx = strcmpi(F,varargin{iV});
         if sum(idx) == 1
            fprintf('<strong>%s</strong>:',F{idx});
            disp(p.(F{idx}));
         end
      end
   end
end

end