
%Copid from DistinctInteraction
%Give State change versus, number of interaction with Low-Medium-High


load('FeatureSetLMH.mat');
load('SurveyLMH.mat');

lineNoSurvey = length(FeatureSetLMH{1,1}(:));
load('Sum_IR_sorted.mat');
lineNoIR = length(Sum_IR_Sorted);

len_W = length(Sum_IR_Sorted(1,:)) ;

for i=1:lineNoSurvey
k = 1;
W = zeros(1,11);
   for j = 1:lineNoIR   
    if (FeatureSetLMH {1,1}(i,1) == Sum_IR_Sorted(j,1) &&...
        FeatureSetLMH{1,2}(i,1)== Sum_IR_Sorted(j,3) && ...%month
        FeatureSetLMH{1,3}(i,1) == Sum_IR_Sorted(j,4) && ... %day
        FeatureSetLMH{1,4}(i,1) <= Sum_IR_Sorted(j,5) && ...%hour
        FeatureSetLMH{1,5}(i,1) > Sum_IR_Sorted(j,5) ...
    ) 

    W(k,1:6)  = Sum_IR_Sorted(j,:);
    %the interacted person personality state in that time window
    
        [X1,Y] = find(FeatureSetLMH {1,1}(:,1) == Sum_IR_Sorted(j,2) &...
        FeatureSetLMH{1,2}(:,1)== Sum_IR_Sorted(j,3) & ...%month
        FeatureSetLMH{1,3}(:,1) == Sum_IR_Sorted(j,4) & ... %day
        FeatureSetLMH{1,4}(:,1) <= Sum_IR_Sorted(j,5) & ...%hour
        FeatureSetLMH{1,5}(:,1) > Sum_IR_Sorted(j,5));
    
    % in Sum_IR_Sorted to keep
    %alter personal state(20,21,22,23,24,25) 
    
     if ~(isempty(X1))
    W(k,7) = FeatureSetLMH{1,11}(X1(1),1); %Extravert
    W(k,8) = FeatureSetLMH{1,12}(X1(1),1); %Aggreableness
    W(k,9) = FeatureSetLMH{1,13}(X1(1),1); %Conscientiousness
    W(k,10) = FeatureSetLMH{1,14}(X1(1),1); %EmotionalStability
    W(k,11) = FeatureSetLMH{1,15}(X1(1),1); %Creativity
     end
    
    k = k + 1 ;
    else
        if k > 1 
            continue;
        end
    end    
    
    end
    if ~(isempty(W))
         time_t = 0; tmpE_l = 0; tmpE_m = 0; tmpE_h = 0;
         time_t_minus = 0; tmpE_l_minus = 0; tmpE_m_minus = 0;
         tmpE_h_minus = 0;
        
   for zz = 1:length(W(:,1))
   
       time_t = mod(W(zz,7),10);
       if time_t == 1
       tmpE_l = tmpE_l + 1;
       elseif time_t == 2
       tmpE_m = tmpE_m + 1; 
       elseif time_t == 3
       tmpE_h = tmpE_h + 1 ;
       end
       
       time_t_minus = floor((W(zz,7)/10));
       if time_t_minus == 1
       tmpE_l_minus = tmpE_l_minus + 1;
       elseif time_t == 2
       tmpE_m_minus = tmpE_m_minus + 1; 
       elseif time_t_minus == 3
       tmpE_h_minus = tmpE_h_minus + 1 ;
       end
   end
      FeatureSetLMH{1,20}(i,1) = tmpE_l;
      FeatureSetLMH{1,21}(i,1) = tmpE_l_minus;
      FeatureSetLMH{1,22}(i,1) = tmpE_m;
      FeatureSetLMH{1,23}(i,1) = tmpE_m_minus;
      FeatureSetLMH{1,24}(i,1) = tmpE_h;
      FeatureSetLMH{1,25}(i,1) = tmpE_h_minus;
%          FeatureSetLMH{1,16}(i,1) = length(unique(W(:,2)));
%          FeatureSetLMH{1,17}(i,1) = length(W(:,1));
    end
end