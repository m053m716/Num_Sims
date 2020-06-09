function varargout = graphics(varargin)
%GRAPHICS  Default parameters for simulation graphics
%
%  param = default.graphics('paramName');
%  [p1,p2,...,pk] = default.graphics('p1','p2','p3',...,'pk');

p = struct;
% May change
p.ResultsName = 'Simulation Results: Fano Factors';
p.Position = [0.1 0.1 0.8 0.8];
p.AxParams = {'XColor','k','YColor','k','LineWidth',1.5,'NextPlot','add','FontName','Arial'};
p.BinVec = [-inf,0.05:0.1:1.95,inf];
p.FontParams = {'FontName','Arial','Color','k'};

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