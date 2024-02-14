
function maps = newton_z ()
  p=0.001
  maps=zeros((2-(-2))/p+1);
  for m=-2:p:2
    for n=-2:p:2
      x=m+n*j;
      y=newton(x,100,0.0001,0.0001);
      d=distance(y);
      maps(round((m+2)/p)+1,round((n+2)/p)+1) = d ;
    endfor
  endfor

endfunction

function [n_i] = distance (x)
  root= roots([1, 0, 0, -1]);%[1,(-0.5+((3^0.5)/2)*i),(-0.5-((3^0.5)/2)*i)];
  [n_v,n_i]=min(abs(x-root));
endfunction

function x = newton (x,n_max,e,del)
  #考慮f(x) = (x-a)(x^2+x+(b+c))，其中abc是你學號的末三碼。
  #請分別撰寫用二分搜尋法及牛頓法找到這個函數的解的程式

  fx=x^3-1;
  for n=1:n_max
    fp=3*x^2;
    if abs(fp)<del
      #print("small derivate");
      break
    endif
    d=fx/fp;
    x=x-d;
    fx=x^3-1;
    if abs(d)<e
      #print("converge")
      break;
    endif
  endfor

endfunction
