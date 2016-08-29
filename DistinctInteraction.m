
load('FeatureSetLMH.mat');
load('SurveyLMH.mat');

lineNoSurvey = length(FeatureSetLMH{1,1}(:));
load('Sum_IR_sorted.mat');
lineNoIR = length(Sum_IR_Sorted);

for i=1:lineNoSurvey
k = 1;
W = [];
    for j = 1:lineNoIR   
    if (FeatureSetLMH {1,1}(i,1) == Sum_IR_Sorted(j,1) &&...
        FeatureSetLMH{1,2}(i,1)== Sum_IR_Sorted(j,3) && ...%month
        FeatureSetLMH{1,3}(i,1) == Sum_IR_Sorted(j,4) && ... %day
        FeatureSetLMH{1,4}(i,1) <= Sum_IR_Sorted(j,5) && ...%hour
        FeatureSetLMH{1,5}(i,1) > Sum_IR_Sorted(j,5) ...
    ) 

    W(k,:)  = Sum_IR_Sorted(j,:);
    k = k + 1 ;
    else
        if k > 1 
            continue;
        end
    end    
    
    end
    if ~(isempty(W))
         FeatureSetLMH{1,16}(i,1) = length(unique(W(:,2)));
         FeatureSetLMH{1,17}(i,1) = length(W(:,1));
    end
end