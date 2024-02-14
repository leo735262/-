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
## @deftypefn {} {@var{retval} =} LU_factor (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: user <user@ubuntu>
## Created: 2022-12-12

function [L, U, x] = LU_factor (A, b)
  #請實做投影片Chapter 8, page 13及15的演算法，以LU分解的形式計算Ax=b問題。 
  #請實作 function [L, U, x] = LU_factor(A, b) 
  #其中A是輸入的矩陣, 
  #b是Ax=b中的b，
  #L和U是分解完的三角矩陣，滿足LU = A，
  #x是Ax=b的解。
 n=size(A,1);
for k=1:n
  L(k,k)=1;
 for j=k:n
   LUsum=0;
   for s=1:(k-1)
     LUsum=LUsum+L(k,s)*U(s,j);
   endfor
   U(k,j)=A(k,j)-LUsum;
 endfor
 for i=k:n
   LUsum=0;
   for s=1:(k-1)
     LUsum=LUsum+L(i,s)*U(s,k);
   endfor
   L(i,k)=(A(i,k)-LUsum)/U(k,k);
 endfor
endfor

z=zeros(1,n);
z(1)=b(1);
for i=2:n
  Lzsum=0;
  for j=1:(i-1)
    Lzsum=Lzsum+L(i,j)*z(j);
  endfor
  z(i)=b(i)-Lzsum;
endfor
x(n)=z(n)/U(n,n);
for i=(n-1):-1:1
  Uxsum=0;
  for j=(i+1):n
    Uxsum=Uxsum+U(i,j)*x(j);
  endfor
  x(i)=(z(i)-Uxsum)/U(i,i);
endfor
endfunction
