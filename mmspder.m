function z = mmspder(x,y,xi)
% MMSPDER Cubic Spline Derivative Interpolation
%	YI = MMSPDER(X,Y,XI)  	finds spline through X and Y and evaluates
%							at points XI.
%	PPD = MMSPDER(PP)  		finds piecewise polynomial vector PPD describing
%							the derivative of the spline stored in PP.
%	YI = MMSPDER(PP,XI)  	evaluates the derivative of the spline stored 
%							in PP at positions XI.

if nargin == 3
	pp = spline(x,y);
else
	pp = x;
end
[br,co,npy,nco,~] = unmkpp(pp);			% take apart pp

% if pp(1) ~= 10
% 	error('Spline Data Does Not Have PP Form.')
% end

sf = nco-1:-1:1;						% scale factors for differentiation
dco = sf(ones(npy,1),:).*co(:,1:nco-1);	% derivative coefficients
ppd = mkpp(br,dco);						% build pp form for derivative
if nargin == 1
	z = ppd;
elseif nargin == 2
	z = ppval(ppd,y);
else
	z = ppval(ppd,xi);
end
	
return