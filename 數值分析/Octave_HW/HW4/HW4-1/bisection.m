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
## @deftypefn {} {@var{retval} =} bisection (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: user <user@ubuntu>
## Created: 2022-10-17

function x= bisection ( x, y, n_max)
  #考慮f(x) = (x-a)(x^2+x+(b+c))，其中abc是你學號的末三碼。
  #請分別撰寫用二分搜尋法及牛頓法找到這個函數的解的程式。
  a=1;
  b=0;
  c=7;
  u=(x-a)*(x^2+x+(b+c));
  v=(y-a)*(y^2+y+(b+c));
  if u*v>=0
    exit;
  endif
  for n=0:n_max
    z=(x+y)/2;
    w=(z-a)*(z^2+z+(b+c));
    if w*u==0
      break
    endif
    if w*u<0
      y=z;
      v=w;
    endif
    if w*u>0
      x=z;
      u=w;
    endif
  endfor
endfunction
