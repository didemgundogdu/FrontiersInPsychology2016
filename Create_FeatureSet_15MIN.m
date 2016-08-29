
load('FeatureSetLH.mat');
load('FifteenMinWindows.mat');
load('SurveyLH');

Feature(:,1) = FeatureSetLH{1,1}(:,1);
Feature(:,2) = FeatureSetLH{1,2}(:,1);
Feature(:,3) = FeatureSetLH{1,3}(:,1);
Feature(:,4) = FeatureSetLH{1,4}(:,1);
Feature(:,5) = FeatureSetLH{1,5}(:,1);
Feature(:,6) = FeatureSetLH{1,11}(:,1);
Feature(:,7) = FeatureSetLH{1,12}(:,1);
Feature(:,8) = FeatureSetLH{1,13}(:,1);
Feature(:,9) = FeatureSetLH{1,14}(:,1);
Feature(:,10) = FeatureSetLH{1,15}(:,1);

SurveyLH = sortrows(SurveyLH,[1,2,3,4]);
lineDeadlines = length(FifteenMinWindows(:,1));
% 
% lineSurvey = length(SurveyLH) ; %length(Feature);
% lineSurvey = lineSurvey - 1 ;
% j =  1 ;  
% for i = 1:lineDeadlines
% 
%     for j=1:lineSurvey
%         
%         if  (SurveyLH(j,1) == FifteenMinWindows(i,1) && ...
%             SurveyLH(j,2) == FifteenMinWindows(i,2) &&...
%             (SurveyLH(j,3) == FifteenMinWindows(i,3) &&...
%             (SurveyLH(j,4) <= FifteenMinWindows(i,6)) &&...
%             (SurveyLH(j+1,3) == FifteenMinWindows(i,3) &&...
%              SurveyLH(j+1,4) > FifteenMinWindows(i,6))...
%              ))
%             
%          
%           
%             FifteenMinWindows(i,10:14) = SurveyLH(j+1,5:9);
%     
%         end
%     end
%     
% end


% this part is adding FifteenMinWindows(35:39) either there is a 
% change or not 

 %FifteenMinWindows(:,35:39) = [] ;

lineSurvey = length(FeatureSetLH{1,1}(:,1)) ; %length(Feature);
for i = 1:lineDeadlines

    for j=1:lineSurvey
        
        if  (FeatureSetLH{1,1}(j,1) == FifteenMinWindows(i,1) && ...
             FeatureSetLH{1,2}(j,1) == FifteenMinWindows(i,2) &&...
             FeatureSetLH{1,3}(j,1) == FifteenMinWindows(i,3) &&...
             FeatureSetLH{1,4}(j,1) == FifteenMinWindows(i,4) &&...
             FeatureSetLH{1,5}(j,1) == FifteenMinWindows(i,5) ...
             )
          
            FifteenMinWindows(i,25) = FeatureSetLH{1,11}(j,1);
            FifteenMinWindows(i,26) = FeatureSetLH{1,12}(j,1);
            FifteenMinWindows(i,27) = FeatureSetLH{1,13}(j,1);
            FifteenMinWindows(i,28) = FeatureSetLH{1,14}(j,1);
            FifteenMinWindows(i,29) = FeatureSetLH{1,15}(j,1);
    
        end
    end
    
end
%from 40-44 either change or not change is depicted
y = find((FifteenMinWindows(:,25) == 1 ) | (FifteenMinWindows(:,25) == 4 ) );
FifteenMinWindows(y(:,1),30) = 0;
y = find((FifteenMinWindows(:,26) == 1 ) | (FifteenMinWindows(:,26) == 4 ) );
FifteenMinWindows(y(:,1),31) = 0;
y = find((FifteenMinWindows(:,27) == 1 ) | (FifteenMinWindows(:,27) == 4 ) );
FifteenMinWindows(y(:,1),32) = 0;
y = find((FifteenMinWindows(:,28) == 1 ) | (FifteenMinWindows(:,28) == 4 ) );
FifteenMinWindows(y(:,1),33) = 0;
y = find((FifteenMinWindows(:,29) == 1 ) | (FifteenMinWindows(:,29) == 4 ) );
FifteenMinWindows(y(:,1),34) = 0;
y = find((FifteenMinWindows(:,25) == 2 ) | (FifteenMinWindows(:,25) == 3 ) );
FifteenMinWindows(y(:,1),30) = 1;
y = find((FifteenMinWindows(:,26) == 2 ) | (FifteenMinWindows(:,26) == 3 ) );
FifteenMinWindows(y(:,1),31) = 1;
y = find((FifteenMinWindows(:,27) == 2 ) | (FifteenMinWindows(:,27) == 3 ) );
FifteenMinWindows(y(:,1),32) = 1;
y = find((FifteenMinWindows(:,28) == 2 ) | (FifteenMinWindows(:,28) == 3 ) );
FifteenMinWindows(y(:,1),33) = 1;
y = find((FifteenMinWindows(:,29) == 2 ) | (FifteenMinWindows(:,29) == 3 ) );
FifteenMinWindows(y(:,1),34) = 1;
