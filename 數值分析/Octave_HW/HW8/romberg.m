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
## @deftypefn {} {@var{retval} =} romberg (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: user <user@ubuntu>
## Created: 2022-12-05



function y=romberg (a, b, n)
  #請實作投影片Chapter 5 page 26-27的Romberg Algorithm，
  #並將完成的.m檔上傳。 其中指定的格式為 function y = romberg(a, b, n)。
  #表示指定的計算區間為[a, b]，計算得和為R(n,n)，回傳的結果y=R(n,n)。
R=zeros (n);
h=b-a;
R(1,1)=(h/2)*[f(a)+f(b)];
  for i=2:n+1
    h=h/2;
    sum=0;
      for k=1:2:2^(i-1)-1
      sum=sum+f(a+k*h) ;
      endfor
      R(i,1)=(1/2)*R(i-1, 1)+sum*h;
      for j=2:i
          R(i,j)=R(i,j-1)+[R(i,j-1)-R(i-1,j-1)]/(4^(j-1)-1);
      endfor
  endfor
y=R;
endfunction

function F=f(x)
F=4/(1+x^2);
endfunction

