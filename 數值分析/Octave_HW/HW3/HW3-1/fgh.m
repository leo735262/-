## Copyright (C) 2022 leo1128
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} fgh (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: leo1128 <leo1128@LAPTOP-K44ODOVD>
## Created: 2022-10-06

function [f,g,h] = fgh (n)
  #回傳值f是每個1/n的值
  #g是將n個1/n相加後的結果
  #h是n乘上1/n後的結果
  #請畫圖比較n從1到100時1-g和1-h的結果
  #並將結果存為fgh.png後上傳
  for i=1:n
    f(i)=1/i;
    g(i)=0;
    for j=1:i
      g(i)=g(i)+f(i);
    endfor
    h(i)=i*f(i);
  endfor
endfunction
