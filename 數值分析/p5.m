
function Lsum = p5 ()
  dx=10^-1;
  Lsum = Rsum (dx);
  for i=1:inf
    if abs(pi-Lsum)>10^-6
      dx*=10^-1
      Lsum = Rsum (dx);
      disp(sprintf('%0.10f',Lsum))
    else
      break
    endif

  endfor
endfunction
