
 
%Copied from DistinctInteraction
%Give State change versus, number of interaction with Low-High

load('SurveyLH.mat');
SurveyLH = sortrows(SurveyLH);
load('FifteenMinWindows.mat');
%FifteenMinWindows(:,15:34) = [] ;

lineNofifteen = length(FifteenMinWindows(:,1));
lineNofifteen = lineNofifteen - 1 ;

load('Ort_Sum_IR_sorted.mat');
lineNoIR = length(Ort_Sum_IR_Sorted);

for i=1:lineNofifteen 
k = 1;
W = zeros(1,11);
   for j = 1:lineNoIR  
       %Here we should check if the interaction is happening
       % in the given time window
    if (FifteenMinWindows(i,1) == Ort_Sum_IR_Sorted(j,1) &&...
        FifteenMinWindows(i,2) == Ort_Sum_IR_Sorted(j,3) && ...%month
        FifteenMinWindows(i,3) == Ort_Sum_IR_Sorted(j,4) && ... %day
       ( FifteenMinWindows(i,6) == Ort_Sum_IR_Sorted(j,5) && ...%hour
        FifteenMinWindows(i,7) <= Ort_Sum_IR_Sorted(j,6)) && ...
       (FifteenMinWindows(i+1,6) == Ort_Sum_IR_Sorted(j,5) &&...
     FifteenMinWindows(i+1,7) > Ort_Sum_IR_Sorted(j,6))...
        ) 

    %The index comes from SurveyLH
        [X1,Y] = find(SurveyLH(:,1) == Ort_Sum_IR_Sorted(j,2) &...
        SurveyLH(:,2) == Ort_Sum_IR_Sorted(j,3) & ...%month
        SurveyLH(:,3) == Ort_Sum_IR_Sorted(j,4) & ... %day
        SurveyLH(:,4) <= Ort_Sum_IR_Sorted(j,5)  ...%hour
        );
    
    % in Sum_IR_Sorted to keep
    % alter personal state(20,21,22,23,24,25) 
    
     if ~(isempty(X1))  
     %we take the time t survey of Alter    
    W(k,1:6)  = Ort_Sum_IR_Sorted(j,:);
    %the interacted person personality state in that time window
    
    W(k,7) = SurveyLH(X1(1),5); %Extravert
    W(k,8) = SurveyLH(X1(1),6); %Aggreableness
    W(k,9) = SurveyLH(X1(1),7); %Conscientiousness
    W(k,10) = SurveyLH(X1(1),8); %EmotionalStability
    W(k,11) = SurveyLH(X1(1),9); %Creativity
     k = k + 1 ;
     end
    
    else
        if k > 1 
            break;
        end
    end    
    
    end
    if ~(isempty(W)) && (W(1,1) ~= 0)
         tmpE_l = 0; tmpE_h = 0; 
         tmpA_l = 0; tmpA_h = 0; 
         tmpC_l = 0; tmpC_h = 0;
         tmpEmo_l = 0; tmpEmo_h = 0;
         tmpCre_l = 0; tmpCre_h = 0; 
           
       for zz = 1:length(W(:,1))
       %EXTRAVERT
       if W(zz,7) == 0
       tmpE_l = tmpE_l + 1;
       elseif W(zz,7) == 1
       tmpE_h = tmpE_h + 1; 
       end
       %AGGREABLENESS
       if W(zz,8) == 0
       tmpA_l = tmpA_l + 1;
       elseif W(zz,8) == 1
       tmpA_h = tmpA_h + 1; 
       end
       %CONSCIENTIOUSNESS
       if W(zz,9) == 0
       tmpC_l = tmpC_l + 1;
       elseif W(zz,9) == 1
       tmpC_h = tmpC_h + 1; 
       end
       %EMOTIONAL
       if W(zz,10) == 0
       tmpEmo_l = tmpEmo_l + 1;
       elseif W(zz,10) == 1
       tmpEmo_h = tmpEmo_h + 1;
       end
          %creativity
       if W(zz,11) == 0
       tmpCre_l = tmpCre_l + 1;
       elseif W(zz,11) == 1
       tmpCre_h = tmpCre_h + 1; 
       end
   end
   
      FifteenMinWindows(i,15) = tmpE_l;
      FifteenMinWindows(i,16) = tmpE_h;
%       FifteenMinWindows(i,17) = tmpE_hl;
%       FifteenMinWindows(i,18) = tmpE_hh;
     
      FifteenMinWindows(i,17) = tmpA_l;
      FifteenMinWindows(i,18) = tmpA_h;
%       FifteenMinWindows(i,21) = tmpA_hl;
%       FifteenMinWindows(i,22) = tmpA_hh;
      
      FifteenMinWindows(i,19) = tmpC_l;
      FifteenMinWindows(i,20) = tmpC_h;
%       FifteenMinWindows(i,25) = tmpC_hl;
%       FifteenMinWindows(i,26) = tmpC_hh;
      
      FifteenMinWindows(i,21) = tmpEmo_l;
      FifteenMinWindows(i,22) = tmpEmo_h;
%       FifteenMinWindows(i,29) = tmpEmo_hl;
%       FifteenMinWindows(i,30) = tmpEmo_hh;
      
      FifteenMinWindows(i,23) = tmpCre_l;
      FifteenMinWindows(i,24) = tmpCre_h;
%       FifteenMinWindows(i,33) = tmpCre_hl;
%       FifteenMinWindows(i,34) = tmpCre_hh;
      
%          FeatureSetLMH{1,16}(i,1) = length(unique(Wx`(:,2)));
%          FeatureSetLMH{1,17}(i,1) = length(W(:,1));
    end
end
%  
% %Copied from DistinctInteraction
% %Give State change versus, number of interaction with Low-High
% 
% load('SurveyLH.mat');
% SurveyLH = sortrows(SurveyLH);
% load('FifteenMinWindows.mat');
% %FifteenMinWindows(:,15:34) = [] ;
% 
% lineNofifteen = length(FifteenMinWindows(:,1));
% lineNofifteen = lineNofifteen - 1 ;
% 
% load('Ort_Sum_IR_sorted.mat');
% lineNoIR = length(Ort_Sum_IR_Sorted);
% 
% for i=1:lineNofifteen 
% k = 1;
% W = zeros(1,11);
%    for j = 1:lineNoIR  
%        %Here we should check if the interaction is happening
%        % in the given time window
%     if (FifteenMinWindows(i,1) == Ort_Sum_IR_Sorted(j,1) &&...
%         FifteenMinWindows(i,2) == Ort_Sum_IR_Sorted(j,3) && ...%month
%         FifteenMinWindows(i,3) == Ort_Sum_IR_Sorted(j,4) && ... %day
%         FifteenMinWindows(i,6) == Ort_Sum_IR_Sorted(j,5) && ...%hour
%         FifteenMinWindows(i,7) >= Ort_Sum_IR_Sorted(j,6) && ...
%         FifteenMinWindows(i+1,7) < Ort_Sum_IR_Sorted(j,6)...
%     ) 
% 
%     W(k,1:6)  = Ort_Sum_IR_Sorted(j,:);
%     %the interacted person personality state in that time window
%     
%     %The index comes from SurveyLH
%         [X1,Y] = find(SurveyLH(:,1) == Ort_Sum_IR_Sorted(j,2) &...
%         SurveyLH(:,2) == Ort_Sum_IR_Sorted(j,3) & ...%month
%         SurveyLH(:,3) == Ort_Sum_IR_Sorted(j,4) & ... %day
%         SurveyLH(:,4) <= Ort_Sum_IR_Sorted(j,5)  ...%hour
%         );
%     
%     % in Sum_IR_Sorted to keep
%     % alter personal state(20,21,22,23,24,25) 
%     
%      if ~(isempty(X1))  
%     W(k,7) = SurveyLH(X1(1),5); %Extravert
%     W(k,8) = SurveyLH(X1(1),6); %Aggreableness
%     W(k,9) = SurveyLH(X1(1),7); %Conscientiousness
%     W(k,10) = SurveyLH(X1(1),8); %EmotionalStability
%     W(k,11) = SurveyLH(X1(1),9); %Creativity
%      end
%     
%     k = k + 1 ;
%     else
%         if k > 1 
%             break;
%         end
%     end    
%     
%     end
%     if ~(isempty(W)) 
%          tmpE_l = 0; tmpE_h = 0; 
%          tmpA_l = 0; tmpA_h = 0; 
%          tmpC_l = 0; tmpC_h = 0;
%          tmpEmo_l = 0; tmpEmo_h = 0;
%          tmpCre_l = 0; tmpCre_h = 0; 
%            
%        for zz = 1:length(W(:,1))
%        %EXTRAVERT
%        if W(zz,7) == 0
%        tmpE_l = tmpE_l + 1;
%        elseif W(zz,7) == 1
%        tmpE_h = tmpE_h + 1; 
%        end
%        %AGGREABLENESS
%        if W(zz,8) == 0
%        tmpA_l = tmpA_l + 1;
%        elseif W(zz,8) == 1
%        tmpA_h = tmpA_h + 1; 
%        end
%        %CONSCIENTIOUSNESS
%        if W(zz,9) == 0
%        tmpC_l = tmpC_l + 1;
%        elseif W(zz,9) == 1
%        tmpC_h = tmpC_h + 1; 
%        end
%        %EMOTIONAL
%        if W(zz,10) == 0
%        tmpEmo_l = tmpEmo_l + 1;
%        elseif W(zz,10) == 1
%        tmpEmo_h = tmpEmo_h + 1;
%        end
%           %creativity
%        if W(zz,11) == 0
%        tmpCre_l = tmpCre_l + 1;
%        elseif W(zz,11) == 1
%        tmpCre_h = tmpCre_h + 1; 
%        end
%    end
%    
%       FifteenMinWindows(i,15) = tmpE_l;
%       FifteenMinWindows(i,16) = tmpE_h;
% %       FifteenMinWindows(i,17) = tmpE_hl;
% %       FifteenMinWindows(i,18) = tmpE_hh;
%      
%       FifteenMinWindows(i,17) = tmpA_l;
%       FifteenMinWindows(i,18) = tmpA_h;
% %       FifteenMinWindows(i,21) = tmpA_hl;
% %       FifteenMinWindows(i,22) = tmpA_hh;
%       
%       FifteenMinWindows(i,19) = tmpC_l;
%       FifteenMinWindows(i,20) = tmpC_h;
% %       FifteenMinWindows(i,25) = tmpC_hl;
% %       FifteenMinWindows(i,26) = tmpC_hh;
%       
%       FifteenMinWindows(i,21) = tmpEmo_l;
%       FifteenMinWindows(i,22) = tmpEmo_h;
% %       FifteenMinWindows(i,29) = tmpEmo_hl;
% %       FifteenMinWindows(i,30) = tmpEmo_hh;
%       
%       FifteenMinWindows(i,23) = tmpCre_l;
%       FifteenMinWindows(i,24) = tmpCre_h;
% %       FifteenMinWindows(i,33) = tmpCre_hl;
% %       FifteenMinWindows(i,34) = tmpCre_hh;
%       
% %          FeatureSetLMH{1,16}(i,1) = length(unique(Wx`(:,2)));
% %          FeatureSetLMH{1,17}(i,1) = length(W(:,1));
%     end
% end