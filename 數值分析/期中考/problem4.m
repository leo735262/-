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
## @deftypefn {} {@var{retval} =} problem4 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: user <user@ubuntu>
## Created: 2022-10-31

function [y] = problem4 (a,b,n,ep)#函式
  #where [a, b] is the target interval
  #n is the number of iterations
  #ep is the required error bound
  #y is the founded root
  
  #f(x)=x^2+9x+7

#測試資料如下-----------------------------------------------
#>> [y] = problem4 (-2,-10,100,0.0001)
#y = -8.1401
#>> [y] = problem4 (0,-10,100,0.0001)
#y = -0.85995
#測試資料如上-----------------------------------------------

  #solution is -0.85995,-8.1401
  
  u=a^2+9*a+7;#u為邊界a的函數值(u=f(a))
  v=b^2+9*b+7;#v為邊界b的函數值(v=f(b))
    
    for i=0:n#n times
      z=(a+b)/2;#中間點
      w=z^2+9*z+7;#中間點的函數值(w=f(z))
      
      if w*u==0#相乘為0=>找到root
        y(1)=a;#put a  in y (root)(put b 也可以)
        break#跳出迴圈
      endif#結束if
      
      if w*u<0#邊界的函數值相乘<0
        b=z;#邊界[a,(a+b)/2]
        v=w;#v改為邊界(a+b)/2的函數值(v=w=f((a+b)/2))
      endif#結束if
      
      if w*u>0#邊界的函數值相乘>0
        a=z;#邊界[(a+b)/2,b]
        u=w;#u改為邊界(a+b)/2的函數值(u=w=f((a+b)/2))
      endif#結束if
      
    endfor#結束迴圈
    
endfunction#結束函式
