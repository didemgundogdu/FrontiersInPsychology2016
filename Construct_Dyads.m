clc 
clear all;
 
%Copied from DistinctInteraction
%Give State change versus, number of interaction with Low-High

load('SurveyLH.mat');
SurveyLH = sortrows(SurveyLH);
load('FifteenMinWindows.mat');
FifteenMinWindows(:,15:34) = [] ;

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
        FifteenMinWindows(i,6) == Ort_Sum_IR_Sorted(j,5) && ...%hour
        FifteenMinWindows(i,7) <= Ort_Sum_IR_Sorted(j,6) && ...
        FifteenMinWindows(i+1,7) > Ort_Sum_IR_Sorted(j,6)...
    ) 

    W(k,1:6)  = Ort_Sum_IR_Sorted(j,:);
    %the interacted person personality state in that time window
    
    %The index comes from SurveyLH
        [X1,Y] = find(SurveyLH(:,1) == Ort_Sum_IR_Sorted(j,2) &...
        SurveyLH(:,2) == Ort_Sum_IR_Sorted(j,3) & ...%month
        SurveyLH(:,3) == Ort_Sum_IR_Sorted(j,4) & ... %day
        SurveyLH(:,4) <= Ort_Sum_IR_Sorted(j,5)  ...%hour
        );
    
    % in Sum_IR_Sorted to keep
    % alter personal state(20,21,22,23,24,25) 
    
     if ~(isempty(X1))  
    W(k,7) = SurveyLH(X1(1),5); %Extravert
    W(k,8) = SurveyLH(X1(1),6); %Aggreableness
    W(k,9) = SurveyLH(X1(1),7); %Conscientiousness
    W(k,10) = SurveyLH(X1(1),8); %EmotionalStability
    W(k,11) = SurveyLH(X1(1),9); %Creativity
     end
    
    k = k + 1 ;
    else
        if k > 1 
            break;
        end
    end    
  end
    %LH and HL interaction will be taken as same type of interaction
     %unlabelled graphlets 
     % first character is number of node, second is number of edge
      tmp_00 = 0 ; %Alone
      tmp_10 = 0 ; tmp_20 = 0 ; tmp_21 = 0 ; tmp_30 = 0;
      tmp_31 = 0 ; tmp_32 = 0 ; tmp_33 = 0 ;
% Number of positive nodes, 
% Number of negative nodes,
% Number of H-H edges
% Number of H-L / L-H edges
% Number of L-L edges
tmpE_0 = 0; tmpA_0 = 0; tmpC_0 = 0;tmpEmo_0 = 0; tmpCre_0 = 0;
tmpE_l = 0; tmpE_h = 0; tmpE_hl = 0; tmpE_ll = 0 ; tmpE_hh = 0 ;
tmpA_l = 0; tmpA_h = 0; tmpA_hl = 0; tmpA_ll = 0 ; tmpA_hh = 0 ;
tmpC_l = 0; tmpC_h = 0; tmpC_hl = 0; tmpC_ll = 0 ; tmpC_hh = 0 ;
tmpEmo_l = 0; tmpEmo_h = 0; tmpEmo_hl = 0; tmpEmo_ll = 0 ; tmpEmo_hh = 0 ;
tmpCre_l = 0; tmpCre_h = 0; tmpCre_hl = 0; tmpCre_ll = 0 ; tmpCre_hh = 0 ;
 
Wq = unique(W(:,[1,2,7,8,9,10,11]),'rows');

   if ( W(1,1) ~= 0 )
       uniqueInteractionNumber = length(unique(W(:,2)));
       Alters = unique(W(:,2));
      if uniqueInteractionNumber == 1
%% Singleton              
              tmp_10 = 1;
      %if it is only one interaction the first line of W 
      % Gives us the states of the alter
      
%%% EXTRAVERSION      
      if  W(1,7) == 1  
          tmpE_h = 1 ;
          if  FifteenMinWindows(i,10) == 1
              tmpE_hh =1 ;
          else
              tmpE_hl = 1;
          end
      else
          tmpE_l = 1;
          if FifteenMinWindows(i,10) == 1 
              tmpE_hl =1 ;
          else
              tmpE_ll = 1;
          end
      end
      %%% Aggreableness      
      if  W(1,8) == 1  
          tmpA_h = 1 ;
          if  FifteenMinWindows(i,11) == 1
              tmpA_hh =1 ;
          else
              tmpA_hl = 1;
          end
      else
          tmpA_l = 1;
          if FifteenMinWindows(i,11) == 1 
              tmpA_hl =1 ;
          else
              tmpA_ll = 1;
          end
      end
 %%% Consciousness      
      if  W(1,9) == 1  
          tmpC_h = 1 ;
          if  FifteenMinWindows(i,12) == 1
              tmpC_hh =1 ;
          else
              tmpC_hl = 1;
          end
      else
          tmpC_l = 1;
          if FifteenMinWindows(i,12) == 1 
              tmpC_hl =1 ;
          else
              tmpC_ll = 1;
          end
      end
      
       %%% Emotional Stability      
      if  W(1,10) == 1  
          tmpEmo_h = 1 ;
          if  FifteenMinWindows(i,13) == 1
              tmpEmo_hh =1 ;
          else
              tmpEmo_hl = 1;
          end
      else
          tmpEmo_l = 1;
          if FifteenMinWindows(i,13) == 1 
              tmpEmo_hl =1 ;
          else
              tmpEmo_ll = 1;
          end
      end
      
        %%% Creativity     
      if  W(1,11) == 1  
          tmpCre_h = 1 ;
          if  FifteenMinWindows(i,14) == 1
              tmpCre_hh =1 ;
          else
              tmpCre_hl = 1;
          end
      else
          tmpCre_l = 1;
          if FifteenMinWindows(i,14) == 1 
              tmpCre_hl =1 ;
          else
              tmpCre_ll = 1;
          end
      end
 %%%%%Copy for all traits     
    elseif uniqueInteractionNumber == 2 
              
      [X1,Y] = find(Alters(1,1) == Ort_Sum_IR_Sorted(:,1) &...
        Alters(2,1) == Ort_Sum_IR_Sorted(:,2) &...
        FifteenMinWindows(i,2) == Ort_Sum_IR_Sorted(:,3) & ...%month
        FifteenMinWindows(i,3) == Ort_Sum_IR_Sorted(:,4) & ... %day
        FifteenMinWindows(i,6) == Ort_Sum_IR_Sorted(:,5) & ...%hour
        FifteenMinWindows(i,7) <= Ort_Sum_IR_Sorted(:,6) & ...
        FifteenMinWindows(i+1,7) > Ort_Sum_IR_Sorted(:,6)...
        );    
    
        if  ~(isempty(X1)) 
              %if there is an interaction between alters 
            tmp_21 =  1;
            %Extravert
             if  FifteenMinWindows(i,10) == 1
                  tmpE_hh = sum(Wq(:,3));
                  tmpE_hl = 3 - tmpE_hh ;
             else
                 tmpE_hl = sum(Wq(:,3));
                  tmpE_ll = 3 - tmpE_hl ;
             end
             %Aggreableness
             if  FifteenMinWindows(i,11) == 1
                  tmpA_hh = sum(Wq(:,4));
                  tmpA_hl = 3 - tmpA_hh ;
             else
                 tmpA_hl = sum(Wq(:,4));
                  tmpA_ll = 3 - tmpA_hl ;
             end
             %Conscientiousness
             if  FifteenMinWindows(i,12) == 1
                  tmpC_hh = sum(Wq(:,5));
                  tmpC_hl = 3 - tmpC_hh ;
             else
                  tmpC_hl = sum(Wq(:,5));
                  tmpC_ll = 3 - tmpC_hl ;
             end
             %Emotional Stability
             if  FifteenMinWindows(i,13) == 1
                  tmpEmo_hh = sum(Wq(:,6));
                  tmpEmo_hl = 3 - tmpEmo_hh ;
             else
                  tmpEmo_hl = sum(Wq(:,6));
                  tmpEmo_ll = 3 - tmpEmo_hl ;
             end
              %Creativity
             if  FifteenMinWindows(i,14) == 1
                  tmpCre_hh = sum(Wq(:,7));
                  tmpCre_hl = 3 - tmpCre_hh ;
             else
                  tmpCre_hl = sum(Wq(:,7));
                  tmpCre_ll = 3 - tmpCre_hl ;
             end
        else
            tmp_20 = 1 ;
            %Extravert
            if  FifteenMinWindows(i,10) == 1
            tmpE_hh = sum(Wq(:,3));
            tmpE_hl = 2 - tmpE_hh ;
            else
            tmpE_hl = sum(Wq(:,3));
            tmpE_ll = 2 - tmpE_hl ;
            end
            %Aggreableness
            if  FifteenMinWindows(i,11) == 1
            tmpA_hh = sum(Wq(:,4));
            tmpA_hl = 2 - tmpA_hh ;
            else
            tmpA_hl = sum(Wq(:,4));
            tmpA_ll = 2 - tmpA_hl ;
            end
            %Conscientiousness
            if  FifteenMinWindows(i,12) == 1
            tmpC_hh = sum(Wq(:,5));
            tmpC_hl = 2 - tmpC_hh ;
            else
            tmpC_hl = sum(Wq(:,5));
            tmpC_ll = 2 - tmpC_hl ;
            end
             %Emotional Stability
            if  FifteenMinWindows(i,13) == 1
            tmpEmo_hh = sum(Wq(:,6));
            tmpEmo_hl = 2 - tmpEmo_hh ;
            else
            tmpEmo_hl = sum(Wq(:,6));
            tmpEmo_ll = 2 - tmpEmo_hl ;
            end
            %Creativity
            if  FifteenMinWindows(i,14) == 1
            tmpCre_hh = sum(Wq(:,7));
            tmpCre_hl = 2 - tmpCre_hh ;
            else
            tmpCre_hl = sum(Wq(:,7));
            tmpCre_ll = 2 - tmpCre_hl ;
            end
        end
      
      %these are neighboring nodes  
      tmpE_h = sum(Wq(:,3)); % they did not count the this id's h/l
      tmpE_l = 2 - tmpE_h;   
      
      tmpA_h = sum(Wq(:,4)); % they did not count the this id's h/l
      tmpA_l = 2 - tmpA_h;   
      
      tmpC_h = sum(Wq(:,5)); % they did not count the this id's h/l
      tmpC_l = 2 - tmpC_h;   
      
      tmpEmo_h = sum(Wq(:,6)); % they did not count the this id's h/l
      tmpEmo_l = 2 - tmpEmo_h;  
      
      tmpCre_h = sum(Wq(:,7)); % they did not count the this id's h/l
      tmpCre_l = 2 - tmpCre_h; 
 %%Start of three nodes            
      elseif uniqueInteractionNumber == 3 
              tmpE_h =  sum(Wq(:,3));
              tmpE_l = 3 - tmpE_h;
              
              tmpA_h =  sum(Wq(:,4));
              tmpA_l = 3 - tmpA_h;
              
              tmpC_h =  sum(Wq(:,5));
              tmpC_l = 3 - tmpC_h;
              
              tmpEmo_h =  sum(Wq(:,6));
              tmpEmo_l = 3 - tmpEmo_h;
              
              tmpCre_h =  sum(Wq(:,7));
              tmpCre_l = 3 - tmpCre_h;
              
     [X1,Y] = find(Alters(1,1) == Ort_Sum_IR_Sorted(:,1) &...
        Alters(2,1) == Ort_Sum_IR_Sorted(:,2) &...
        FifteenMinWindows(i,2) == Ort_Sum_IR_Sorted(:,3) & ...%month
        FifteenMinWindows(i,3) == Ort_Sum_IR_Sorted(:,4) & ... %day
        FifteenMinWindows(i,6) == Ort_Sum_IR_Sorted(:,5) & ...%hour
        FifteenMinWindows(i,7) <= Ort_Sum_IR_Sorted(:,6) & ...
        FifteenMinWindows(i+1,7) > Ort_Sum_IR_Sorted(:,6)...
        );    
              
        [X2,Y] = find(Alters(1,1) == Ort_Sum_IR_Sorted(:,1) &...
        Alters(3,1) == Ort_Sum_IR_Sorted(:,2) &...
        FifteenMinWindows(i,2) == Ort_Sum_IR_Sorted(:,3) & ...%month
        FifteenMinWindows(i,3) == Ort_Sum_IR_Sorted(:,4) & ... %day
        FifteenMinWindows(i,6) == Ort_Sum_IR_Sorted(:,5) & ...%hour
        FifteenMinWindows(i,7) <= Ort_Sum_IR_Sorted(:,6) & ...
        FifteenMinWindows(i+1,7) > Ort_Sum_IR_Sorted(:,6)...
        );
    
        [X3,Y] = find(Alters(2,1) == Ort_Sum_IR_Sorted(:,1) &...
        Alters(3,1) == Ort_Sum_IR_Sorted(:,2) &...
        FifteenMinWindows(i,2) == Ort_Sum_IR_Sorted(:,3) & ...%month
        FifteenMinWindows(i,3) == Ort_Sum_IR_Sorted(:,4) & ... %day
        FifteenMinWindows(i,6) == Ort_Sum_IR_Sorted(:,5) & ...%hour
        FifteenMinWindows(i,7) <= Ort_Sum_IR_Sorted(:,6) & ...
        FifteenMinWindows(i+1,7) > Ort_Sum_IR_Sorted(:,6)...
        );   
     if  ~(isempty(X1) && isempty(X2)&& isempty(X3) ) 
         edgeNo = 6;
         tmp_33 = 1 ;
     elseif ( ~(isempty(X1) && isempty(X2))&& isempty(X3) ||...
            ~(isempty(X3) && isempty(X2))&& isempty(X1) || ...
            ~(isempty(X3) && isempty(X1))&& isempty(X2))    
         edgeNo = 5 ;
         tmp_32 = 1 ; 
     
     elseif  ( (isempty(X1) && isempty(X2))&& ~(isempty(X3))) ||...
             ((isempty(X3) && isempty(X2))&& ~(isempty(X1))) || ...
            ((isempty(X3) && isempty(X1))&& ~(isempty(X2)))    
          edgeNo = 4 ;
          tmp_31 = 1 ;
     elseif  (isempty(X1) && isempty(X2) && isempty(X3))
          edgeNo = 3 ;
          tmp_30 = 1 ;
     end      
             % Extravert
              if FifteenMinWindows(i,10) == 1
                  tmpE_hh = sum(Wq(:,3));
                  tmpE_hl = edgeNo - tmpE_hh ;
              else
                  tmpE_hl = sum(Wq(:,3));
                  tmpE_ll = edgeNo - tmpE_hl;
              end
              
                % Aggreableness
              if FifteenMinWindows(i,11) == 1
                  tmpA_hh = sum(Wq(:,4));
                  tmpA_hl = edgeNo - tmpA_hh ;
              else
                  tmpA_hl = sum(Wq(:,4));
                  tmpA_ll = edgeNo - tmpA_hl;
              end
              
              % Conscientiousness
              if FifteenMinWindows(i,12) == 1
                  tmpC_hh = sum(Wq(:,5));
                  tmpC_hl = edgeNo - tmpC_hh ;
              else
                  tmpC_hl = sum(Wq(:,5));
                  tmpC_ll = edgeNo - tmpC_hl;
              end
              
               % Emotional Stability
              if FifteenMinWindows(i,13) == 1
                  tmpEmo_hh = sum(Wq(:,6));
                  tmpEmo_hl = edgeNo - tmpEmo_hh ;
              else
                  tmpEmo_hl = sum(Wq(:,6));
                  tmpEmo_ll = edgeNo - tmpEmo_hl;
              end
                  %Creativity
              if FifteenMinWindows(i,14) == 1
                  tmpCre_hh = sum(Wq(:,7));
                  tmpCre_hl = edgeNo - tmpCre_hh ;
              else
                  tmpCre_hl = sum(Wq(:,7));
                  tmpCre_ll = edgeNo - tmpCre_hl;
              end
              
      tmpE_h = sum(Wq(:,3)); % they did not count the this id's h/l
      tmpE_l = 3 - tmpE_h;      
      
      tmpA_h = sum(Wq(:,4)); % they did not count the this id's h/l
      tmpA_l = 3 - tmpA_h;      
      
      tmpC_h = sum(Wq(:,5)); % they did not count the this id's h/l
      tmpC_l = 3 - tmpC_h;     
      
      tmpEmo_h = sum(Wq(:,6)); % they did not count the this id's h/l
      tmpEmo_l = 3 - tmpEmo_h;  
      
      tmpCre_h = sum(Wq(:,7)); % they did not count the this id's h/l
      tmpCre_l = 3 - tmpCre_h;   
   else
       %means no interaction at that time
        tmp_00 = 1 ; 
        tmpE_0 = FifteenMinWindows(i,10);
        tmpE_h = 0 ;%FifteenMinWindows(i,10);
        tmpE_l = 0 ; %1 - tmpE_h ;
        
        tmpA_0 = FifteenMinWindows(i,11);
        tmpA_h = 0 ;%FifteenMinWindows(i,10);
        tmpA_l = 0 ; %1 - tmpE_h ;
        
        tmpC_0 = FifteenMinWindows(i,12);
        tmpC_h = 0 ;%FifteenMinWindows(i,10);
        tmpC_l = 0 ; %1 - tmpE_h ;
        
        tmpEmo_0 = FifteenMinWindows(i,13);
        tmpEmo_h = 0 ;%FifteenMinWindows(i,10);
        tmpEmo_l = 0 ; %1 - tmpE_h ;
        
        tmpCre_0 = FifteenMinWindows(i,14);
        tmpCre_h = 0 ;%FifteenMinWindows(i,10);
        tmpCre_l = 0 ; %1 - tmpE_h ;
   end
   end
      Graphlet(i,1:7) = FifteenMinWindows(i,1:7);     
      Graphlet(i,8) = tmp_00 ; 
      Graphlet(i,9) = tmp_10 ;
      Graphlet(i,10) = tmp_20 ;
      Graphlet(i,11) = tmp_21 ;
      Graphlet(i,12) = tmp_30 ;
      Graphlet(i,13) = tmp_31 ;
      Graphlet(i,14) = tmp_32 ;
      Graphlet(i,15) = tmp_33 ;
      
%Extravert
      Graphlet(i,16) = tmpE_0;
      Graphlet(i,17) = tmpE_l;
      Graphlet(i,18) = tmpE_h;
      Graphlet(i,19) = tmpE_ll;
      Graphlet(i,20) = tmpE_hh;
      Graphlet(i,21) = tmpE_hl;
%Agreeableness          
      Graphlet(i,22) = tmpA_0;
      Graphlet(i,23) = tmpA_l;
      Graphlet(i,24) = tmpA_h;
      Graphlet(i,25) = tmpA_ll;
      Graphlet(i,26) = tmpA_hh;
      Graphlet(i,27) = tmpA_hl;
%Consciousness          
      Graphlet(i,28) = tmpC_0;
      Graphlet(i,29) = tmpC_l;
      Graphlet(i,30) = tmpC_h;
      Graphlet(i,31) = tmpC_ll;
      Graphlet(i,32) = tmpC_hh;
      Graphlet(i,33) = tmpC_hl;   
%Emotional Stability
      Graphlet(i,34) = tmpEmo_0;
      Graphlet(i,35) = tmpEmo_l;
      Graphlet(i,36) = tmpEmo_h;
      Graphlet(i,37) = tmpEmo_ll;
      Graphlet(i,38) = tmpEmo_hh;
      Graphlet(i,39) = tmpEmo_hl;   
%Creativity
      Graphlet(i,40) = tmpCre_0;
      Graphlet(i,41) = tmpCre_l;
      Graphlet(i,42) = tmpCre_h;
      Graphlet(i,43) = tmpCre_ll;
      Graphlet(i,44) = tmpCre_hh;
      Graphlet(i,45) = tmpCre_hl;  
end