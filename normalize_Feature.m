%calculate normalized data for each user 

clc
clear all ;
load('FeatureSetLMH.mat');

tmpUser = FeatureSetLMH{1,1}(1,1) ;
tmpUnique = FeatureSetLMH{1,16}(1,1) ;
tmpInteraction = FeatureSetLMH{1,17}(1,1) ; 

maxUnique = FeatureSetLMH{1,16}(1,1) ;
maxInteraction = FeatureSetLMH{1,17}(1,1);

numUserUnique = length(unique(FeatureSetLMH{1,1}(:,1)));

Avg = zeros(numUserUnique,3,'double');

k = 1 ;
LineNo = 0 ;
 for i=1:length(FeatureSetLMH{1,1}(:,1))
 
     if tmpUser == FeatureSetLMH{1,1}(i,1)
        
         LineNo = LineNo + 1 ;
         tmpUnique = tmpUnique + FeatureSetLMH{1,16}(i,1) ;
         tmpInteraction = tmpInteraction + FeatureSetLMH{1,17}(i,1) ;
         
         if FeatureSetLMH{1,16}(i,1) > maxUnique 
             maxUnique = FeatureSetLMH{1,16}(i,1);
         end
         
         if FeatureSetLMH{1,17}(i,1) > maxInteraction 
             maxInteraction = FeatureSetLMH{1,17}(i,1);
         end
         
     else
         Avg(k,1) = tmpUser;
         Avg(k,2) = double(tmpUnique / LineNo);
         Avg(k,3) = double(tmpInteraction / LineNo) ;
         Avg(k,4) = maxUnique ;
         Avg(k,5) = maxInteraction ;
         k = k + 1 ;
         LineNo = 1 ;
         tmpUser = FeatureSetLMH{1,1}(i,1) ;
         tmpUnique = FeatureSetLMH{1,16}(i,1) ;
         tmpInteraction =  FeatureSetLMH{1,17}(i,1) ;
     end
     
 end
 
  Avg(k,1) = tmpUser;
  Avg(k,2) = tmpUnique / LineNo;
  Avg(k,3) = tmpInteraction / LineNo ;
  Avg(k,4) = maxUnique ;
  Avg(k,5) = maxInteraction ;
  
  % divide each row with the max value of the user
  
  for i=1:length(FeatureSetLMH{1,1}(:,1))
      
      index = find(FeatureSetLMH{1,1}(i,1) == Avg(:,1));
      
      FeatureSetLMH{1,18}(i,1) = FeatureSetLMH{1,16}(i,1) / Avg(index,4) ;
      FeatureSetLMH{1,19}(i,1) = FeatureSetLMH{1,17}(i,1) / Avg(index,5) ;    
  end