
function Lsum = Rsum (dx)
  Lsum=0;
  for x=-1:dx:1
    Lsum+=((1-x^2)^0.5)*dx*2;
  endfor
