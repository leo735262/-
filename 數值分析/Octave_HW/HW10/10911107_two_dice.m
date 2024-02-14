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
## @deftypefn {} {@var{retval} =} two_dice (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: user <user@ubuntu>
## Created: 2022-12-19

function [Y, S ] = two_dice (X, N)
  #請實作投影片chapter 13 page 21的題目。 
  #請計算丟兩個骰子時，出現的點數(2到12)的機率分布，並用hist作圖。 
  #其中，實作的函式為 function [Y, S ]= two_dice(X, N) 
  #X為骰子出現一到六點的機率分布(PMF)，N為實驗的次數，
  #Y為最後出現點數的機率，S是每一次出現的點數。 
  #請上傳你的m-file以及兩張圖(檔名為exp1.png, exp2.png)，
  #第一張為公正骰子的結果，第二張為投影片指定的機率的結果。(使用hist()函數繪圖) 

  for i=1:6
    y(i)=sum(X(1:i));
  endfor
  r=rand(N,2);
  Y=zeros(1,12);
  for i=1:N
    m=0;
    for j1=1:6
      if r(i,1)<y(j1)
        m=j1;
        break
      endif
    endfor
    for j2=1:6
      if r(i,2)<y(j2)
        m+=j2;
        break
      endif
    endfor
    S(i)=m;
    Y(m)+=1;
  endfor
  Y/=N;
endfunction
