function x=problem21(A,B,b)

  #用size函式得出A,B陣列的長度為m,n
  m=size(A,2);
  n=size(B,2);
  #x歸零
  x=0;
  #b的i-1次方的起始值
   b1=1;
for i=1:m
  #把b進位的陣列A每一項提出來乘以b1(當下位數的值)使得轉乘10進位的整數再累加到x中
  x+=A(i)*(b1);
  #到下一個位數
  b1*=b;
endfor
  #b的-i次方的起始值
b1=b^-1;
for i =1:n
    #把b進位的陣列B每一項提出來乘以b1(當下位數的值)使得轉乘10進位的小數再累加到x中
  x+=B(i)*(b1);
  #到下一個位數
  b1*=b.^-1;
endfor

endfunction
