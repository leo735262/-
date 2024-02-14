## Copyright (C) 2022 user
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} baseconvert (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: user <user@ubuntu>
## Created: 2022-09-26

function [C,D]= baseconvert (x, b, n)
  a=floor(x);
  f=x-a;
  i=1;
  C(1)=0;
  
  while(a)
  C(i)=mod(a,b);
  a=(a-C(i))/b;
  i++;
endwhile
C=flip(C);

 for i =1:n
   D(i)=floor(f*b);
   f=f*b-floor(f*b);
 endfor
  
endfunction
