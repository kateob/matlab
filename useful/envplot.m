function handle=envplot(xval,yval,colr)
% - 	
% 
%USAGE -	
%
%EXPLANATION -	
%
%SEE ALSO -	
%

%PROGRAM - 	MATLAB code by c.m.duncombe rae
%
%CREATED -	2009/03/20 
%	$Revision: 1.3 $
%	$Date: 2011-04-09 14:05:14 $
%	$Id: envplot.m,v 1.3 2011-04-09 14:05:14 duncombe Exp $
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

% plot on current figure

handle=nan(1,5);
hold on;
handle([1,5])=plot(xval(:,[1,5]),yval(:,[1,5]),[colr ':'],'linewidth',2);
handle([2,4])=plot(xval(:,[2,4]),yval(:,[2,4]),[colr '-'],'linewidth',1);
handle(3)=plot(xval(:,3),yval(:,3),[colr],'linewidth',2);
return;

