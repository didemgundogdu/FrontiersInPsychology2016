clc 
clear all;
 
%Copied from DistinctInteraction
%Give State change versus, number of interaction with Low-High

load('SurveyLH.mat');
SurveyLH = sortrows(SurveyLH);
load('FifteenMinWindows.mat');

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
    %LH and HL interaction will be taken as same type of interaction
     %unlabelled graphlets 
 
%S - Singleton D-Dyad B-Closed Dyad
%F - 3 node- no connection
%G - 3 node 2 connected each
%H - 3 node one connected all
%J - 3 node all connected
% tmp + (PERSONALITY STATE) + GraphType + Alter Labels

tmpESl = 0; tmpESh = 0; 
tmpEDhl = 0;tmpEDll = 0; tmpEDhh = 0 ;
tmpEBhl = 0;tmpEBll = 0; tmpEBhh = 0 ;
tmpEFhlh =0; tmpEFhll =0; tmpEFlll = 0; tmpEFhhh = 0 ;
tmpEGhlh =0; tmpEGhll =0; tmpEGlll = 0; tmpEGhhh = 0 ;
tmpEHhlh =0; tmpEHhll =0; tmpEHlll = 0; tmpEHhhh = 0 ;
tmpEJhlh =0; tmpEJhll =0; tmpEJlll = 0; tmpEJhhh = 0 ;

tmpASl = 0; tmpASh = 0; 
tmpADhl = 0;tmpADll = 0; tmpADhh = 0 ;
tmpABhl = 0;tmpABll = 0; tmpABhh = 0 ;
tmpAFhlh =0; tmpAFhll =0; tmpAFlll = 0; tmpAFhhh = 0 ;
tmpAGhlh =0; tmpAGhll =0; tmpAGlll = 0; tmpAGhhh = 0 ;
tmpAHhlh =0; tmpAHhll =0; tmpAHlll = 0; tmpAHhhh = 0 ;
tmpAJhlh =0; tmpAJhll =0; tmpAJlll = 0; tmpAJhhh = 0 ;

tmpCSl = 0; tmpCSh = 0; 
tmpCDhl = 0;tmpCDll = 0; tmpCDhh = 0 ;
tmpCBhl = 0;tmpCBll = 0; tmpCBhh = 0 ;
tmpCFhlh =0; tmpCFhll =0; tmpCFlll = 0; tmpCFhhh = 0 ;
tmpCGhlh =0; tmpCGhll =0; tmpCGlll = 0; tmpCGhhh = 0 ;
tmpCHhlh =0; tmpCHhll =0; tmpCHlll = 0; tmpCHhhh = 0 ;
tmpCJhlh =0; tmpCJhll =0; tmpCJlll = 0; tmpCJhhh = 0 ;

tmpEmoSl = 0; tmpEmoSh = 0; 
tmpEmoDhl = 0;tmpEmoDll = 0; tmpEmoDhh = 0 ;
tmpEmoBhl = 0;tmpEmoBll = 0; tmpEmoBhh = 0 ;
tmpEmoFhlh =0; tmpEmoFhll =0; tmpEmoFlll = 0; tmpEmoFhhh = 0 ;
tmpEmoGhlh =0; tmpEmoGhll =0; tmpEmoGlll = 0; tmpEmoGhhh = 0 ;
tmpEmoHhlh =0; tmpEmoHhll =0; tmpEmoHlll = 0; tmpEmoHhhh = 0 ;
tmpEmoJhlh =0; tmpEmoJhll =0; tmpEmoJlll = 0; tmpEmoJhhh = 0 ;

tmpCreSl = 0; tmpCreSh = 0; 
tmpCreDhl = 0;tmpCreDll = 0; tmpCreDhh = 0 ;
tmpCreBhl = 0;tmpCreBll = 0; tmpCreBhh = 0 ;
tmpCreFhlh =0; tmpCreFhll =0; tmpCreFlll = 0; tmpCreFhhh = 0 ;
tmpCreGhlh =0; tmpCreGhll =0; tmpCreGlll = 0; tmpCreGhhh = 0 ;
tmpCreHhlh =0; tmpCreHhll =0; tmpCreHlll = 0; tmpCreHhhh = 0 ;
tmpCreJhlh =0; tmpCreJhll =0; tmpCreJlll = 0; tmpCreJhhh = 0 ;

Wq = unique(W(:,[1,2,7,8,9,10,11]),'rows');

   if ( W(1,1) ~= 0 ) && (W(1,1) ~= 0)
       uniqueInteractionNumber = length(unique(W(:,2)));
       Alters = unique(W(:,2));
      if uniqueInteractionNumber == 1
%% Singleton              
      %if it is only one interaction the first line of W 
      % Gives us the states of the alter
      
%%% EXTRAVERSION      
      if  W(1,7) == 1  
          tmpESh = 1 ;
      else
          tmpESl = 1;
      end
      %%% Aggreableness      
      if  W(1,8) == 1  
          tmpASh = 1 ;
      else
          tmpASl = 1;
      end
 %%% Consciousness      
      if  W(1,9) == 1  
          tmpCSh = 1 ;
      else
          tmpCSl = 1;         
      end
      
       %%% Emotional Stability      
      if  W(1,10) == 1  
          tmpEmoSh = 1 ;
      else
          tmpEmoSl = 1;
      end
      
        %%% Creativity     
      if  W(1,11) == 1  
          tmpCreSh = 1 ;
      else
          tmpCreSl = 1;     
      end
 %%%%%Copy for all traits     
    elseif uniqueInteractionNumber == 2 
              
      [X1,Y] = find(Alters(1,1) == Ort_Sum_IR_Sorted(:,1) &...
                Alters(2,1) == Ort_Sum_IR_Sorted(:,2) &...
        FifteenMinWindows(i,2) == Ort_Sum_IR_Sorted(:,3) & ...%month
        FifteenMinWindows(i,3) == Ort_Sum_IR_Sorted(:,4) & ... %day  
      ( FifteenMinWindows(i,6) == Ort_Sum_IR_Sorted(j,5) & ...%hour
        FifteenMinWindows(i,7) <= Ort_Sum_IR_Sorted(j,6)) & ...
       (FifteenMinWindows(i+1,6) == Ort_Sum_IR_Sorted(j,5) &...
        FifteenMinWindows(i+1,7) > Ort_Sum_IR_Sorted(j,6))...
        ) ; 
%     FifteenMinWindows(i,6) == Ort_Sum_IR_Sorted(:,5) & ...%hour     
%     FifteenMinWindows(i,7) <= Ort_Sum_IR_Sorted(:,6) & ...
%         FifteenMinWindows(i+1,7) > Ort_Sum_IR_Sorted(:,6)...
%         );    
        if  ~(isempty(X1)) 
              %if there is an interaction between alters 
             total =  sum(Wq(:,3));
            %Extravert
             if  total == 0
                  tmpEBll = 1 ;
             elseif total == 1
                 tmpEBhl = 1 ;
             elseif total == 2 
                  tmpEBhh = 1 ;
             end
             
             %Aggreableness
             total =  sum(Wq(:,4));
             if  total == 0
                  tmpABll = 1 ;
             elseif total == 1
                 tmpABhl = 1 ;
             elseif total == 2 
                  tmpABhh = 1 ;
             end
             
             %Conscientiousness
             total =  sum(Wq(:,5));
             if  total == 0
                  tmpCBll = 1 ;
             elseif total == 1
                 tmpCBhl = 1 ;
             elseif total == 2 
                  tmpCBhh = 1 ;
             end
             %Emotional Stability
             total =  sum(Wq(:,6));
             if  total == 0
                  tmpEmoBll = 1 ;
             elseif total == 1
                 tmpEmoBhl = 1 ;
             elseif total == 2 
                  tmpEmoBhh = 1 ;
             end
              %Creativity
             total =  sum(Wq(:,7));
             if  total == 0
                  tmpCreBll = 1 ;
             elseif total == 1
                 tmpCreBhl = 1 ;
             elseif total == 2 
                  tmpCreBhh = 1 ;
             end
        else
            %Dyad, alters with no connection
            total =  sum(Wq(:,3));
            %Extravert
             if  total == 0
                  tmpEDll = 1 ;
             elseif total == 1
                 tmpEDhl = 1 ;
             elseif total == 2 
                  tmpEDhh = 1 ;
             end
             
             %Aggreableness
             total =  sum(Wq(:,4));
             if  total == 0
                  tmpADll = 1 ;
             elseif total == 1
                 tmpADhl = 1 ;
             elseif total == 2 
                  tmpADhh = 1 ;
             end
             
             %Conscientiousness
             total =  sum(Wq(:,5));
             if  total == 0
                  tmpCDll = 1 ;
             elseif total == 1
                 tmpCDhl = 1 ;
             elseif total == 2 
                  tmpCDhh = 1 ;
             end
             %Emotional Stability
             total =  sum(Wq(:,6));
             if  total == 0
                  tmpEmoDll = 1 ;
             elseif total == 1
                 tmpEmoDhl = 1 ;
             elseif total == 2 
                  tmpEmoDhh = 1 ;
             end
              %Creativity
             total =  sum(Wq(:,7));
             if  total == 0
                  tmpCreDll = 1 ;
             elseif total == 1
                 tmpCreDhl = 1 ;
             elseif total == 2 
                  tmpCreDhh = 1 ;
             end
        end

 %%Start of three nodes            
      elseif uniqueInteractionNumber == 3 
                          
     [X1,Y] = find(Alters(1,1) == Ort_Sum_IR_Sorted(:,1) &...
        Alters(2,1) == Ort_Sum_IR_Sorted(:,2) &...
        FifteenMinWindows(i,2) == Ort_Sum_IR_Sorted(:,3) & ...%month
        FifteenMinWindows(i,3) == Ort_Sum_IR_Sorted(:,4) & ... %day
      ( FifteenMinWindows(i,6) == Ort_Sum_IR_Sorted(j,5) & ...%hour
        FifteenMinWindows(i,7) <= Ort_Sum_IR_Sorted(j,6)) & ...
       (FifteenMinWindows(i+1,6) == Ort_Sum_IR_Sorted(j,5) &...
        FifteenMinWindows(i+1,7) > Ort_Sum_IR_Sorted(j,6))...
        ) ; 
%         FifteenMinWindows(i,6) == Ort_Sum_IR_Sorted(:,5) & ...%hour
%         FifteenMinWindows(i,7) <= Ort_Sum_IR_Sorted(:,6) & ...
%         FifteenMinWindows(i+1,7) > Ort_Sum_IR_Sorted(:,6)...
%         );    
              
        [X2,Y] = find(Alters(1,1) == Ort_Sum_IR_Sorted(:,1) &...
        Alters(3,1) == Ort_Sum_IR_Sorted(:,2) &...
        FifteenMinWindows(i,2) == Ort_Sum_IR_Sorted(:,3) & ...%month
        FifteenMinWindows(i,3) == Ort_Sum_IR_Sorted(:,4) & ... %day
      ( FifteenMinWindows(i,6) == Ort_Sum_IR_Sorted(j,5) & ...%hour
        FifteenMinWindows(i,7) <= Ort_Sum_IR_Sorted(j,6)) & ...
       (FifteenMinWindows(i+1,6) == Ort_Sum_IR_Sorted(j,5) &...
        FifteenMinWindows(i+1,7) > Ort_Sum_IR_Sorted(j,6))...
        ) ; 
%         FifteenMinWindows(i,6) == Ort_Sum_IR_Sorted(:,5) & ...%hour
%         FifteenMinWindows(i,7) <= Ort_Sum_IR_Sorted(:,6) & ...
%         FifteenMinWindows(i+1,7) > Ort_Sum_IR_Sorted(:,6)...
%         );
    
        [X3,Y] = find(Alters(2,1) == Ort_Sum_IR_Sorted(:,1) &...
        Alters(3,1) == Ort_Sum_IR_Sorted(:,2) &...
        FifteenMinWindows(i,2) == Ort_Sum_IR_Sorted(:,3) & ...%month
        FifteenMinWindows(i,3) == Ort_Sum_IR_Sorted(:,4) & ... %day
      ( FifteenMinWindows(i,6) == Ort_Sum_IR_Sorted(j,5) & ...%hour
        FifteenMinWindows(i,7) <= Ort_Sum_IR_Sorted(j,6)) & ...
       (FifteenMinWindows(i+1,6) == Ort_Sum_IR_Sorted(j,5) &...
        FifteenMinWindows(i+1,7) > Ort_Sum_IR_Sorted(j,6))...
        ) ; 
%         FifteenMinWindows(i,6) == Ort_Sum_IR_Sorted(:,5) & ...%hour
%         FifteenMinWindows(i,7) <= Ort_Sum_IR_Sorted(:,6) & ...
%         FifteenMinWindows(i+1,7) > Ort_Sum_IR_Sorted(:,6)...
%         );   
     if  ~(isempty(X1) && isempty(X2)&& isempty(X3) ) 
         edgeNo = 6;
            %STRONGLY CONNECTED
             total =  sum(Wq(:,3));
            %Extravert
             if  total == 0
                  tmpEJlll = 1 ;
             elseif total == 1
                 tmpEJhll = 1 ;
             elseif total == 2 
                  tmpEJhlh = 1 ;
             elseif total == 3 
                 tmpEJhhh = 1 ;
             end
             
              total =  sum(Wq(:,4));
            %aGG
             if  total == 0
                  tmpAJlll = 1 ;
             elseif total == 1
                 tmpAJhll = 1 ;
             elseif total == 2 
                  tmpAJhlh = 1 ;
             elseif total == 3 
                 tmpAJhhh = 1 ;
             end
             
           total =  sum(Wq(:,5));
            %cONS
             if  total == 0
                  tmpCJlll = 1 ;
             elseif total == 1
                 tmpCJhll = 1 ;
             elseif total == 2 
                  tmpCJhlh = 1 ;
             elseif total == 3 
                 tmpCJhhh = 1 ;
             end
                                     
           total =  sum(Wq(:,6));
            %EMO
             if  total == 0
                  tmpEmoJlll = 1 ;
             elseif total == 1
                 tmpEmoJhll = 1 ;
             elseif total == 2 
                  tmpEmoJhlh = 1 ;
             elseif total == 3 
                 tmpEmoJhhh = 1 ;
             end  
             
                 total =  sum(Wq(:,7));
            %cre
             if  total == 0
                 tmpCreJlll = 1 ;
             elseif total == 1
                 tmpCreJhll = 1 ;
             elseif total == 2 
                 tmpCreJhlh = 1 ;
             elseif total == 3 
                 tmpCreJhhh = 1 ;
             end  
             
     elseif ( ~(isempty(X1) && isempty(X2))&& isempty(X3) ||...
            ~(isempty(X3) && isempty(X2))&& isempty(X1) || ...
            ~(isempty(X3) && isempty(X1))&& isempty(X2))    
         edgeNo = 5 ;
         
          total =  sum(Wq(:,3));
         %Extravert
             if  total == 0
                  tmpEHlll = 1 ;
             elseif total == 1
                 tmpEHhll = 1 ;
             elseif total == 2 
                  tmpEHhlh = 1 ;
             elseif total == 3 
                 tmpEHhhh = 1 ;
             end
     
                total =  sum(Wq(:,4));
            %aGG
             if  total == 0
                  tmpAHlll = 1 ;
             elseif total == 1
                 tmpAHhll = 1 ;
             elseif total == 2 
                  tmpAHhlh = 1 ;
             elseif total == 3 
                 tmpAHhhh = 1 ;
             end
             
           total =  sum(Wq(:,5));
            %cONS
             if  total == 0
                  tmpCHlll = 1 ;
             elseif total == 1
                 tmpCHhll = 1 ;
             elseif total == 2 
                  tmpCHhlh = 1 ;
             elseif total == 3 
                 tmpCHhhh = 1 ;
             end
                                     
           total =  sum(Wq(:,6));
            %EMO
             if  total == 0
                  tmpEmoHlll = 1 ;
             elseif total == 1
                 tmpEmoHhll = 1 ;
             elseif total == 2 
                  tmpEmoHhlh = 1 ;
             elseif total == 3 
                 tmpEmoHhhh = 1 ;
             end  
             
            total =  sum(Wq(:,7));
            %cre
             if  total == 0
                 tmpCreHlll = 1 ;
             elseif total == 1
                 tmpCreHhll = 1 ;
             elseif total == 2 
                 tmpCreHhlh = 1 ;
             elseif total == 3 
                 tmpCreHhhh = 1 ;
             end 
     elseif  ( (isempty(X1) && isempty(X2))&& ~(isempty(X3))) ||...
             ((isempty(X3) && isempty(X2))&& ~(isempty(X1))) || ...
            ((isempty(X3) && isempty(X1))&& ~(isempty(X2)))    
          edgeNo = 4 ;
          
      total =  sum(Wq(:,3));
                %Extravert
             if  total == 0
                  tmpEGlll = 1 ;
             elseif total == 1
                 tmpEGhll = 1 ;
             elseif total == 2 
                  tmpEGHhlh = 1 ;
             elseif total == 3 
                 tmpEGhhh = 1 ;
             end
          
            total =  sum(Wq(:,4));
            %aGG
             if  total == 0
                  tmpAGlll = 1 ;
             elseif total == 1
                 tmpAGhll = 1 ;
             elseif total == 2 
                  tmpAGhlh = 1 ;
             elseif total == 3 
                 tmpAGhhh = 1 ;
             end
             
           total =  sum(Wq(:,5));
            %cONS
             if  total == 0
                  tmpCGlll = 1 ;
             elseif total == 1
                 tmpCGhll = 1 ;
             elseif total == 2 
                  tmpCGhlh = 1 ;
             elseif total == 3 
                 tmpCGhhh = 1 ;
             end
                                     
           total =  sum(Wq(:,6));
            %EMO
             if  total == 0
                  tmpEmoGlll = 1 ;
             elseif total == 1
                 tmpEmoGhll = 1 ;
             elseif total == 2 
                  tmpEmoGhlh = 1 ;
             elseif total == 3 
                 tmpEmoGhhh = 1 ;
             end  
             
            total =  sum(Wq(:,7));
            %cre
             if  total == 0
                 tmpCreGlll = 1 ;
             elseif total == 1
                 tmpCreGhll = 1 ;
             elseif total == 2 
                 tmpCreGhlh = 1 ;
             elseif total == 3 
                 tmpCreGhhh = 1 ;
             end 
             
     elseif  (isempty(X1) && isempty(X2) && isempty(X3))
          edgeNo = 3 ;
          tmp_30 = 1 ;
           total =  sum(Wq(:,3));
           %Extravert
             if  total == 0
                  tmpEFlll = 1 ;
             elseif total == 1
                 tmpEFhll = 1 ;
             elseif total == 2 
                  tmpEFhlh = 1 ;
             elseif total == 3 
                 tmpEFhhh = 1 ;
             end
       
           total =  sum(Wq(:,4));
            %aGG
             if  total == 0
                  tmpAFlll = 1 ;
             elseif total == 1
                 tmpAFhll = 1 ;
             elseif total == 2 
                  tmpAFhlh = 1 ;
             elseif total == 3 
                 tmpAFhhh = 1 ;
             end
             
           total =  sum(Wq(:,5));
            %cONS
             if  total == 0
                  tmpCFlll = 1 ;
             elseif total == 1
                 tmpCFhll = 1 ;
             elseif total == 2 
                  tmpCFhlh = 1 ;
             elseif total == 3 
                 tmpCFhhh = 1 ;
             end
                                     
           total =  sum(Wq(:,6));
            %EMO
             if  total == 0
                  tmpEmoFlll = 1 ;
             elseif total == 1
                 tmpEmoFhll = 1 ;
             elseif total == 2 
                  tmpEmoFhlh = 1 ;
             elseif total == 3 
                 tmpEmoFhhh = 1 ;
             end  
             
            total =  sum(Wq(:,7));
            %cre
             if  total == 0
                 tmpCreFlll = 1 ;
             elseif total == 1
                 tmpCreFhll = 1 ;
             elseif total == 2 
                 tmpCreFhlh = 1 ;
             elseif total == 3 
                 tmpCreFhhh = 1 ;
             end
      end      
      
      else
      
       %NO INTERACTION
   end
   end
      GraphletFeature(i,1:7) = FifteenMinWindows(i,1:7);   
      GraphletFeature(i,8:12) = FifteenMinWindows(i,30:34);   

%Extravert
      GraphletFeature(i,13) = tmpESl; 
      GraphletFeature(i,14) = tmpESh ;
      GraphletFeature(i,15) = tmpEDhl ;
      GraphletFeature(i,16) = tmpEDll ;
      GraphletFeature(i,17) = tmpEDhh ;
      GraphletFeature(i,18) = tmpEBhl ;
      GraphletFeature(i,19) = tmpEBll ;
      GraphletFeature(i,20) = tmpEBhh ;
      GraphletFeature(i,21) = tmpEFhlh;
      GraphletFeature(i,22) = tmpEFhll;
      GraphletFeature(i,23) = tmpEFlll;
      GraphletFeature(i,24) = tmpEFhhh;
      GraphletFeature(i,25) = tmpEGhlh;
      GraphletFeature(i,26) = tmpEGhll;    
      GraphletFeature(i,27) = tmpEGlll;
      GraphletFeature(i,28) = tmpEGhhh;
      GraphletFeature(i,29) = tmpEHhlh;
      GraphletFeature(i,30) = tmpEHhll;
      GraphletFeature(i,31) = tmpEHlll;
      GraphletFeature(i,32) = tmpEHhhh;
      GraphletFeature(i,33) = tmpEJhlh;
      GraphletFeature(i,34) = tmpEJhll;
      GraphletFeature(i,35) = tmpEJlll;
      GraphletFeature(i,36) = tmpEJhhh;
     %Aggreableness
      GraphletFeature(i,37) = tmpASl;
      GraphletFeature(i,38) = tmpASh;
      GraphletFeature(i,39) = tmpADhl;
      GraphletFeature(i,40) = tmpADll;
      GraphletFeature(i,41) = tmpADhh;
      GraphletFeature(i,42) = tmpABhl;
      GraphletFeature(i,43) = tmpABll;   
      GraphletFeature(i,44) = tmpABhh;      
      GraphletFeature(i,45) = tmpAFhlh;
      GraphletFeature(i,46) = tmpAFhll;
      GraphletFeature(i,47) = tmpAFlll;
      GraphletFeature(i,48) = tmpAFhhh;
      GraphletFeature(i,49) = tmpAGhlh;   
      GraphletFeature(i,50) = tmpAGhll;
      GraphletFeature(i,51) = tmpAGlll;
      GraphletFeature(i,52) = tmpAGhhh;
      GraphletFeature(i,53) = tmpAHhlh;
      GraphletFeature(i,54) = tmpAHhll;
      GraphletFeature(i,55) = tmpAHlll;   
      GraphletFeature(i,56) = tmpAHhhh;
      GraphletFeature(i,57) = tmpAJhlh;
      GraphletFeature(i,58) = tmpAJhll;
      GraphletFeature(i,59) = tmpAJlll;
      GraphletFeature(i,60) = tmpAJhhh;
 %Consciousness   
      GraphletFeature(i,61) = tmpCSl;
      GraphletFeature(i,62) = tmpCSh;
      GraphletFeature(i,63) = tmpCDhl;
      GraphletFeature(i,64) = tmpCDll;
      GraphletFeature(i,65) = tmpCDhh;
      GraphletFeature(i,66) = tmpCBhl;
      GraphletFeature(i,67) = tmpCBll;   
      GraphletFeature(i,68) = tmpCBhh;      
      GraphletFeature(i,69) = tmpCFhlh;
      GraphletFeature(i,70) = tmpCFhll;
      GraphletFeature(i,71) = tmpCFlll;
      GraphletFeature(i,72) = tmpCFhhh;
      GraphletFeature(i,73) = tmpCGhlh;   
      GraphletFeature(i,74) = tmpCGhll;
      GraphletFeature(i,75) = tmpCGlll;
      GraphletFeature(i,76) = tmpCGhhh;
      GraphletFeature(i,77) = tmpCHhlh;
      GraphletFeature(i,78) = tmpCHhll;
      GraphletFeature(i,79) = tmpCHlll;   
      GraphletFeature(i,80) = tmpCHhhh;
      GraphletFeature(i,81) = tmpCJhlh;
      GraphletFeature(i,82) = tmpCJhll;
      GraphletFeature(i,83) = tmpCJlll;
      GraphletFeature(i,84) = tmpCJhhh;
       %Emotional Stability
      GraphletFeature(i,85) = tmpEmoSl; 
      GraphletFeature(i,86) = tmpEmoSh ;
      GraphletFeature(i,87) = tmpEmoDhl ;
      GraphletFeature(i,88) = tmpEmoDll ;
      GraphletFeature(i,89) = tmpEmoDhh ;
      GraphletFeature(i,90) = tmpEmoBhl ;
      GraphletFeature(i,91) = tmpEmoBll ;
      GraphletFeature(i,92) = tmpEmoBhh ;
      GraphletFeature(i,93) = tmpEmoFhlh;
      GraphletFeature(i,94) = tmpEmoFhll;
      GraphletFeature(i,95) = tmpEmoFlll;
      GraphletFeature(i,96) = tmpEmoFhhh;
      GraphletFeature(i,97) = tmpEmoGhlh;
      GraphletFeature(i,98) = tmpEmoGhll;    
      GraphletFeature(i,99) = tmpEmoGlll;
      GraphletFeature(i,100) = tmpEmoGhhh;
      GraphletFeature(i,101) = tmpEmoHhlh;
      GraphletFeature(i,102) = tmpEmoHhll;
      GraphletFeature(i,103) = tmpEmoHlll;
      GraphletFeature(i,104) = tmpEmoHhhh;
      GraphletFeature(i,105) = tmpEmoJhlh;
      GraphletFeature(i,106) = tmpEmoJhll;
      GraphletFeature(i,107) = tmpEmoJlll;
      GraphletFeature(i,108) = tmpEmoJhhh;
      %Creativity
      GraphletFeature(i,109) = tmpCreSl;
      GraphletFeature(i,110) = tmpCreSh;
      GraphletFeature(i,111) = tmpCreDhl;
      GraphletFeature(i,112) = tmpCreDll;
      GraphletFeature(i,113) = tmpCreDhh;
      GraphletFeature(i,114) = tmpCreBhl;
      GraphletFeature(i,115) = tmpCreBll;   
      GraphletFeature(i,116) = tmpCreBhh;      
      GraphletFeature(i,117) = tmpCreFhlh;
      GraphletFeature(i,118) = tmpCreFhll;
      GraphletFeature(i,119) = tmpCreFlll;
      GraphletFeature(i,120) = tmpCreFhhh;
      GraphletFeature(i,121) = tmpCreGhlh;   
      GraphletFeature(i,122) = tmpCreGhll;
      GraphletFeature(i,123) = tmpCreGlll;
      GraphletFeature(i,124) = tmpCreGhhh;
      GraphletFeature(i,125) = tmpCreHhlh;
      GraphletFeature(i,126) = tmpCreHhll;
      GraphletFeature(i,127) = tmpCreHlll;   
      GraphletFeature(i,128) = tmpCreHhhh;
      GraphletFeature(i,129) = tmpCreJhlh;
      GraphletFeature(i,130) = tmpCreJhll;
      GraphletFeature(i,131) = tmpCreJlll;
      GraphletFeature(i,132) = tmpCreJhhh;
end