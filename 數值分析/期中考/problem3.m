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
## @deftypefn {} {@var{retval} =} problem3 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: user <user@ubuntu>
## Created: 2022-10-31


function [x] = problem3 (s,c,f)#函式
  #s, c and f are arrays with length 1, 8,and 23
  # and the value of each element in these arraysare 0 or 1.
  C = problem2 (c, [0],2);#利用problem2將2進制轉為十進制
  F = problem2 ([1],f,2);#利用problem2將2進制轉為十進制
  x(1)=((-1)^s)*(2^(C-127))*(F);#利用公式:(-1)^s * 2^(c-127) * (1.f)(2) 帶入求解

endfunction#結束函式
