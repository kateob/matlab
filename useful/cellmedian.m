function [V]=cellmedian(C)
%CELLMEDIAN - 	returns the median of the cell argument
% 
%USAGE -	[V]=cellmedian(C)
%
%EXPLANATION -	To get the statistics on many items which may not
%               be the same size. Uses nanmedian.
% 		
% 		C - cell of vectors
%		V - vector of median of the cell items
% 
%
%SEE ALSO -	cellmax, cellmin
% 
%NOTE:	this function is redundant: the same effect can be accomplished 
%	by cellfun(@nanmedian,C)
%

%PROGRAM - 	MATLAB code by c.m.duncombe rae
%
%CREATED -	2009/03/11 
%	$Revision: 1.6 $
%	$Date: 2011-04-09 14:05:14 $
%	$Id: cellmedian.m,v 1.6 2011-04-09 14:05:14 duncombe Exp $
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

for i=1:length(C),
	V(i)=nanmedian(C{i});
end;
return;

