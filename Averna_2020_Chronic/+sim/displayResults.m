function fig = displayResults(test)
%DISPLAYRESULTS Create histogram of Fano Factor distributions
%
% fig = sim.displayResults(test);
%
% Inputs
%  test - struct, where each field is a "sub-struct" containing the fields
%         `mean` and `variance` (which should have the same number of 
%          elements within the sub-struct, but not from one to the other)
%
% Output
%  fig  - Handle to `matlab.graphics.figure` object

[figName,pos,axParams,binVec,fontParams] = default.graphics(...
   'ResultsName','Position','AxParams','BinVec','FontParams');

fig = figure(...
   'Name',figName,...
   'NumberTitle','off',...
   'Color','w',...
   'Units','Normalized',...
   'Position',pos);
figure(fig); % Make sure it is current figure

fn = fieldnames(test);
fn = setdiff(fn,'info');
N = numel(fn);

nRow = floor(sqrt(N));
nCol = ceil(N/nRow);

for iF = 1:N
   ax = subplot(nRow,nCol,iF);
   set(ax,axParams{:});
   ff = compute_fano_factor(test,fn{iF});
   histogram(ff,binVec);
   title(ax,strrep(fn{iF},'_',' '),fontParams{:});
   xlabel(ax,'Fano Factor',fontParams{:});
   ylabel(ax,'Count',fontParams{:});
end
suptitle(sprintf('\\lambda: %g | framelen: %g',...
   test.info.lambda,test.info.framelen));
   function ff = compute_fano_factor(s,type)
      %COMPUTE_FANO_FACTOR Compute fano factor for a given field
      %
      % ff = compute_fano_factor(s,type);
      %
      % Inputs
      %  s    - `test` struct (same as main input)
      %  type - char name of sub-struct field 
      %
      % Output
      %  ff   - Fano factor corresponding to each element
      
      ff = s.(type).variance ./ s.(type).mean;      
   end

end