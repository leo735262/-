function [count,partialsum,Seriesvalue] = p4 ()
                  #第4題 先計算出該級數的值
  Seriesvalue=3;                   #表示級數的值
  for i=1:10^6                     #用for跑公式累加
    Seriesvalue+=(-1)^(i+1)*(4/(2*i*(2*i+1)*(2*i+2)));
  endfor
                 #計算精準度如果要到小樹下10位需要計算到多少項(count)
  partialsum=3.0;                  #表示partialsum的值(0!=1)
  count=1;                         #計算項數的variable
  for count=1:10^6                 #用for跑公式累加
    partialsum+=(-1)^(count+1)*4/(2*count*(2*count+1)*(2*count+2));
    if abs(partialsum-Seriesvalue)<=10^-11 #計算誤差(<10^-10)
      break                        #達到誤差就跳出迴圈
    endif
  endfor
disp(sprintf('%0.10f',partialsum)) #印出partialsum到小數後10位的值
endfunction


#結果
#>> [count,partialsum,Seriesvalue]=p4()
#3.1415926536
#count = 2922
#partialsum = 3.141592653579788
#Seriesvalue = 3.141592653589787
