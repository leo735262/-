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
## @deftypefn {} {@var{retval} =} LUT (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: user <user@ubuntu>
## Created: 2022-11-28

function [L, U, T] = LUT (a, b, n)
  #請實作投影片Chapter 5中計算L(f; P),U(f;P)以及T(f;P)的演算法，
  #比較不同的n值下在三種方法的計算結果。
  #請實作function [L, U, T] = LUT(a, b, n)計算 exp(-x^2)在[a, b]區間上，
  #將[a, b]區間分為n等分時的最大下界和L(f;P)，最小上界和U(f;P)以及使用梯形法的和T(f;P)。
  #其中n是大於　０的整數，且 a < b。 請上傳你實作的m-file。 
  h=(b-a)/n;
  sum=0;
  for i=n:-1:1
    x=a+i*h;
    sum=sum+exp(-(x^2));
  endfor
  L=sum*h;
  U=L+h*(exp(-(a^2))-exp(-(b^2)));
  sumT=0.5*(exp(-(a^2))-exp(-(b^2)));
  for i=1:(n-1)
    x=a+i*h;
    sumT=sumT+exp(-(x^2));
  endfor
  T=sumT*h;

endfunction
