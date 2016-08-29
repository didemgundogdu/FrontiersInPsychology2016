%Find the last survey filling for each day. 


load('SurveyLMH_Sorted.mat');


lenSurvey = length(SurveyLMH_Sorted);

Survey = sortrows(SurveyLMH_Sorted,[2,3,4]);

tmpMon = Survey(1,2);
tmpDay = Survey(1,3);
tmpHourBegin = Survey(1,4);
tmpHourEnd = Survey(1,4);

% Survey_Sum(1,1) = tmpMon ;
% Survey_Sum(1,2) = tmpDay ;
% Survey_Sum(1,3) = tmpHourBegin;
% Survey_Sum(1,4) = tmpHourEnd;


k = 1 ;
for i=2:lenSurvey

    
    if (tmpMon ~= Survey(i,2) || tmpDay ~= Survey(i,3) )
 
    Survey_Sum(k,1) = tmpMon;
    Survey_Sum(k,2) = tmpDay;
    Survey_Sum(k,3) = tmpHourBegin;
    Survey_Sum(k,4) = tmpHourEnd;
    k = k + 1 ;
    tmpMon = Survey(i,2);
    tmpDay = Survey(i,3);
    tmpHourBegin = Survey(i,4);
    tmpHourEnd = Survey(i,4);

    continue;
    end
    
    
    if ( tmpMon == Survey(i,2) && ...
         tmpDay == Survey(i,3) && ...
         tmpHourBegin > Survey(i,4))  
     
     tmpHourBegin = Survey(i,4) ;
    end
    
    if ( tmpMon == Survey(i,2) && ...
         tmpDay == Survey(i,3) && ...
         tmpHourEnd < Survey(i,4))  
     
     tmpHourEnd = Survey(i,4);
        
    end
    
end
