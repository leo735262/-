
function [count,partialsum,Seriesvalue] = p3 ()
                  #第3題 先計算出該級數的值
  Seriesvalue=0;                   #表示級數的值(初始化0)
  for n=0:inf                     #用for跑公式累加
    Seriesvalue+=(-1)^n*(4/(2*n+1));      #公式
  endfor
                 #計算精準度如果要到小樹下10位需要計算到多少項(count)
  partialsum=0;                  #表示partialsum的值(初始化0)
  count=0;                         #計算項數的variable
  for count=0:inf                 #用for跑公式累加
    partialsum+=(-1)^count*(4/(2*count+1));#公式
    if abs(partialsum-Seriesvalue)<=10^-11 #計算誤差(<10^-10)
      break                        #達到誤差就跳出迴圈
    endif
  endfor
disp(sprintf('%0.10f',partialsum)) #印出partialsum到小數後10位的值
endfunction

