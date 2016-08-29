
clc 
clear all;
load('Sum_IR_Sorted.mat');

lineNo = length(Sum_IR_Sorted(:,1));
k = 1;

for i=1:lineNo
    ThisId = Sum_IR_Sorted(i,1);
    AlterId = Sum_IR_Sorted(i,2);
    tmpMonth = Sum_IR_Sorted(i,3);
    tmpDay = Sum_IR_Sorted(i,4);
    tmpHour = Sum_IR_Sorted(i,5);
    tmpMin = Sum_IR_Sorted(i,6);
    clear X;
    clear Y;
    
    [X,Y] = find (ThisId == Sum_IR_Sorted(:,2) & ...
                  AlterId == Sum_IR_Sorted(:,1) & ...
                  tmpMonth == Sum_IR_Sorted(:,3) &...
                  tmpDay == Sum_IR_Sorted(:,4) & ...
                  tmpHour == Sum_IR_Sorted(:,5) & ...
                  tmpMin == Sum_IR_Sorted(:,6)...
             );
         
   if  isempty(X)
      tmpOrt(k,1) = AlterId; 
      tmpOrt(k,2) = ThisId; 
      tmpOrt(k,3) = tmpMonth; 
      tmpOrt(k,4) = tmpDay; 
      tmpOrt(k,5) = tmpHour; 
      tmpOrt(k,6) = tmpMin; 
        k = k + 1 ;
    end
end
Ort_Sum_IR_Sorted = vertcat(Sum_IR_Sorted,tmpOrt);