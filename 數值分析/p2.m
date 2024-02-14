
function [count,partialsum,Seriesvalue] = p2 ()
                  #第2題 先計算出該級數的值
  factorial=1;                     #表示階乘
  Seriesvalue=1;                   #表示級數的值(0!=1)
  for i=1:10^6                     #用for跑公式累加
    factorial*=i;                  #計算階乘
    Seriesvalue+=1/factorial;      #用1除(公式)
  endfor
                 #計算精準度如果要到小樹下10位需要計算到多少項(count)
  partialsum=1.0;                  #表示partialsum的值(0!=1)
  factorial=1;                     #初始化階乘
  count=1;                         #計算項數的variable
  for count=1:10^6                 #用for跑公式累加
    factorial*=count;              #計算階乘
    partialsum+=1/factorial;       #用1除(公式)
    if abs(partialsum-Seriesvalue)<=10^-11 #計算誤差(<10^-10)
      break                        #達到誤差就跳出迴圈
    endif
  endfor
disp(sprintf('%0.10f',partialsum)) #印出partialsum到小數後10位的值
endfunction

#結果
#>> [count,partialsum,Seriesvalue]=p2()
#2.7182818285
#count = 14
#partialsum = 2.718281828458230
#Seriesvalue = 2.718281828459046
