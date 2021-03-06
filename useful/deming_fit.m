function [beta,delta]=deming_fit(xi,yi,xvar,yvar)
% 
%DEMING - fits regression where both x and y have errors of known variance
% 
%USAGE -	[beta,delta]=deming_fit(xi,yi,xvar,yvar)
%
%EXPLANATION -	xi, yi - data
% 		xvar, yvar - variance of the data. if not
% 		provided, xvar/yvar is assumed equal 1, if only
% 		xvar provided, yvar is assumed equal xvar.
% 		% to be done: if xvar and yvar are vectors, use
% 		% the info.
% 		beta - coefficients of the regression, Y=beta(2)+beta(1)*X
% 		delta - ratio of x and y variances
%
%SEE ALSO -	
%
%SOURCE - Wikipedia:deming_regression

%PROGRAM - 	MATLAB code by c.m.duncombe rae
%
%CREATED -	2010/11/17 
%	$Revision: 1.4 $
%	$Date: 2011-04-09 14:05:14 $
%	$Id: deming_fit.m,v 1.4 2011-04-09 14:05:14 duncombe Exp $
%	$Name:  $
%
%CHANGELOG -	
%
%
%     This program is free software: you can redistribute it and/or
% modify it under the terms of the GNU General Public License as
% published by the Free Software Foundation, either version 3 of
% the License, or (at your option) any later version.
% 
%     This program is distributed in the hope that it will be
% useful, but WITHOUT ANY WARRANTY; without even the implied
% warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
% See the GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public
% License along with this program.  If not, see
% <http://www.gnu.org/licenses/>.
% 
% See accompanying script gpl-3.0.m
% 
%

if exist('xvar')~=1, xvar=1; end;
if exist('yvar')~=1, yvar=xvar; end;

% if xvar and or yvar is a vector of length(xi) then we should
% calculate the variance for the caller.  Skip for now.

delta=yvar./xvar;

n=length(xi); % check for nans!
xbar=sum(xi)./n;
ybar=sum(yi)./n;
dx=xi-xbar;
dy=yi-ybar;
sxx=sum(dx.*dx)./(n-1);
syy=sum(dy.*dy)./(n-1);
sxy=sum(dx.*dy)./(n-1);

% beta is [int; slope]
beta=[0;1];

beta(2)=(syy-delta.*sxx+sqrt((syy-delta.*sxx).^2+4.*delta.*sxy.^2))./(2.*sxy);
beta(1)=ybar-beta(2).*xbar;

% X=xi+(beta(2)./(beta(2).^2+delta)).*(yi-beta(1)-beta(2).*xi);
% Y=beta(2).*X+beta(1);

return;

