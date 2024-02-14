
function [count,partialsum,Seriesvalue] = p1 ()
  #第一題 先計算出該級數的值
  #以10^6當作infinit
  Seriesvalue=0.0;
  for i=1:10^6
    Seriesvalue+=1/i^4;
  endfor
  #計算精準度如果要到小樹下10位需要計算到多少項(count)
  partialsum=0.0;
  count=1;
  for count=1:10^6
    partialsum+=1/count^4;
    if abs(partialsum-Seriesvalue)<=10^-11
      break
    endif
  endfor
disp(sprintf('%0.10f',partialsum))
endfunction

#結果
#>> [count,partialsum,Seriesvalue]=p1()
#1.0823232337
#count = 3189
#partialsum = 1.082323233700868
#Seriesvalue = 1.082323233710861

