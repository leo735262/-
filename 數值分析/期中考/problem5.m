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
## @deftypefn {} {@var{retval} =} problem5 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: user <user@ubuntu>
## Created: 2022-10-31

function [y] = problem5 (x,ep)#函式
   #x is the initial point 
   #ep is the required maximum error
   #f(x)=x^2+9x+7

#測試資料如下-----------------------------------------------
#>> [y] = problem5 (0,0.001)
#y = -0.85994
#>> [y] = problem5 (-8,0.001)
#y = -8.1401
#測試資料如上-----------------------------------------------


  n_max=100;#n_max為執行次數

  fx=x^2+9*x+7;#the function value of initial point(fx=f(x))
  for n=1:n_max#執行n_max次
    fp=2*x+9;#fp=f'(x) the 一次微分函數值 of initial point
    if abs(fp)<ep#如果一次微分函數值的絕對值小於maximum error(ep)
      y(1)=x;#成功找到 root
      break;#跳出迴圈
    endif#結束if
    d=fx/fp;#下一個尋找的點
    x=x-d;#下一個尋找的點(xi=x(i-1)-f(x(i-1))/f'(x(i-1)))
    fx=x^2+9*x+7;#下一個尋找的點的函數值
    if abs(d)<ep#如果尋找的點的絕對值小於maximum error(ep)
      y(1)=x;#成功找到 root
      break;#跳出迴圈
    endif#結束if
    
  endfor#結束迴圈

endfunction#結束函式
