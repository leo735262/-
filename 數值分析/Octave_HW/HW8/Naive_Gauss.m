function x = Naive_Gauss (n, a, b)
  #\:8acb\:5be6\:4f5cChapter 7\:4e2dPage 8\:7684Naive_Gauss Elimination\:4e26\:4e0a\:50b3\:5b8c\:6210\:7684 . m\:6a94\:3002
  #\:5be6\:4f5c\:7684\:5167\:5bb9\:70ba function x = Naive_Gauss(n, a, b)
  #\:5176\:4e2dn\:70ba\:65b9\:7a0b\:5f0f\:7684\:6578\:91cf\:ff0ca\:70ba\:4fc2\:6578\:77e9\:9663\:ff0cb\:70ba\:65b9\:7a0b\:5de6\:908a\:7684\:503c\:ff0cx\:70ba\:6700\:5f8c\:89e3\:51fa\:4f86\:7684x_ 1\:5230x_n\:7684\:89e3\:679c\:3002
  for k=1:(n-1)
    for i=k+1:n
      xmult=a (i,k)/a(k,k);
      a(i,k)=0;
      for j=k+1:n
        a(i,j)=a(i,j)-xmult*a(k,j);
      endfor
      b(i)=b(i)-xmult*b(k);
    endfor
  endfor
  x(n)=b (n)/a(n,n);
  for i=n-1:-1:1
    sum=b(i);
    for j=i+1:n
      sum=sum-a(i,j)*x(j);
    endfor
    x(i)=sum/a(i,i);
  endfor
endfunction
