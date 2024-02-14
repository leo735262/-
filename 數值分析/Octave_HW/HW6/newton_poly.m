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
## @deftypefn {} {@var{retval} =} newton_poly (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: user <user@ubuntu>
## Created: 2022-11-21

function y = newton_poly(X, Y, n, x)
  #請參照投影片Chapter 4 page 13的作業，
  #實做一個名為newton_poly的函式，
  #其中 function y = newton_poly(X, Y, n, x) X為輸入的點的x座標的陣列， 
  #Y為輸入的點的y座標的陣列， 
  #n為輸入的點的數量，也就是X，Y的長度為n，x為最後要測試的f(x)的x值，y為最後估計的f(x)的結果。 
  #請上傳完成的.m檔。 
  
  #x| 0,1,  2  ,3,4
  #y| 0,1,2.001,3,4
  
  for i=0:n
    a(i+1,1)=Y(i+1);
  endfor
  
  for j=1:n
    for i=0:n-j
      a(i+1,j+1)=(a(i+2,j)-a(i+1,j))/(X(i+j+1)-X(i+1));
    endfor
  endfor
  
  y=0;
  xterm=1;
  for i=0:n
    y=y+a(1,i+1)*xterm;
    xterm=xterm*(x-X(i+1));
  endfor

endfunction
