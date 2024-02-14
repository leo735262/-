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
## @deftypefn {} {@var{retval} =} problem1 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: user <user@ubuntu>
## Created: 2022-10-31

function [y] = problem1 (c,h,n)#函式
  #c is the indicated point for f'(x)
  #h is a given small amount
  #n is the number of expected output
  #y is an array with n approximated value 
  
   #f(x)=x^3+x^2+7
  fc=c^3+c^2+7; #f(c)
  x=0;          #初始化
  for i=1:n     #做n次(n次方)
    x=c+h^i;     #每跑一次迴圈，x改為c+h的i次方，i從1~輸入的n
    y(i)=((x^3+x^2+7)-(fc))/(x-c);#(f'(x)=f(c+h^i)-f(c))/(x-c)微分公式
  endfor#結束迴圈

endfunction#結束函式
