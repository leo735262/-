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
## @deftypefn {} {@var{retval} =} problem2 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: user <user@ubuntu>
## Created: 2022-10-31

function x = problem2 (A, B,b)#函式
  #A 是包含整數部分的數組
  #B是包含base-b中小數部分的數組
  #b 是 2、8 或 16
  #x:以 10 為底的輸出數

  m=length(A);#m is length of A
  n=length(B);#n is length of B
  x=0;        #初始化

  #公式:x=(A(1)b^0+A(2)b^1+...+A(m)b^m-1)+(B(1)b^0+B(2)b^-1+...+B(m)b^-n)
  sumA=0;     #初始化
  sumB=0;     #初始化
  for i=1:m   #先算出sumA=(A(1)b^0+A(2)b^1+...+A(m)b^m-1)
    sumA=sumA+A(i)*b^(i-1);
  endfor      #結束迴圈
  for i=1:n   #先算出sumB=(B(1)b^0+B(2)b^-1+...+B(m)b^-n)
    sumB=sumB+B(i)*b^(-i);
  endfor      #結束迴圈
  x=sumA+sumB;  #x=sumA+sumB

endfunction     #結束函式
