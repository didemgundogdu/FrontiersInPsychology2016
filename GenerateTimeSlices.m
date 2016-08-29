clc
clear all
load('FeatureSetLH.mat');

%Each users survey begin and date is divided into 15 min slices
% Starting 30 min before 30 min after the surveys
lineNoSurvey = length(FeatureSetLH{1,1}(:));

SortedSurvey(:,1) = FeatureSetLH{1,1}(:);
SortedSurvey(:,2) = FeatureSetLH{1,2}(:);
SortedSurvey(:,3) = FeatureSetLH{1,3}(:);
SortedSurvey(:,4) = FeatureSetLH{1,4}(:);
SortedSurvey(:,5) = FeatureSetLH{1,5}(:);

SortedSurvey = sortrows(SortedSurvey);

z = 1;
%%%%%%%%%%%
for i=1:lineNoSurvey 
               
    HourDiff = SortedSurvey(i,5) - SortedSurvey(i,4);
    looptimes = ( HourDiff * 4 )  ; %End of survey is in hour precision
    %took 30 min before and 30 min before the second the survey
    
    for j =1:looptimes % 
    FifteenMinWindows(z,1) = SortedSurvey(i,1);
    FifteenMinWindows(z,2) = SortedSurvey(i,2);
    FifteenMinWindows(z,3) = SortedSurvey(i,3);
    FifteenMinWindows(z,4) = SortedSurvey(i,4);
    FifteenMinWindows(z,5) = SortedSurvey(i,5);
    
   if j == 1 
        FifteenMinWindows(z,6) = SortedSurvey(i,4) - 1 ;
        FifteenMinWindows(z,7) = 30;
   elseif j == 2
        FifteenMinWindows(z,6) = SortedSurvey(i,4) - 1 ;
        FifteenMinWindows(z,7) = 45;
%    elseif j == ( looptimes - 1 )
%         FifteenMinWindows(z,6) = FeatureSetLH{1,5}(i,1) + 1 ;
%         FifteenMinWindows(z,7) = 0;
%    elseif j == looptimes
%         FifteenMinWindows(z,6) = FeatureSetLH{1,5}(i,1) + 1 ;
%         FifteenMinWindows(z,7) = 15;
   else
        mult = (j-3) * 15 ;
        minute = mod(mult,60);
        hour = floor(double(mult) / 60);
        FifteenMinWindows(z,6) =SortedSurvey(i,4) + hour;
        FifteenMinWindows(z,7) = minute ;
   end
        z = z + 1 ;
    end
end


