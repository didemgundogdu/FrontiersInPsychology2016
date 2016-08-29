    
%In this script, L-H change is depicted.
% L = 1 <= L <3
% M = 3 <= M <5
% H = 5 <= H <=7

% In code L = 1, M = 2, H = 3

clc
clear all;
load('Sum_IR_sorted.mat');
load('TraitCall.mat');
load('TraitDateTime.mat');
%TraitCall{1,9} -> Month
%TraitCall{1,10} -> Day
%%TraitCall{1,11} -> Hour
load('SurveyLH.mat');
surveyLine = length(SurveyLH(:,1));

load('SurveyLH.mat');

%%%%%% old version
tmpUsr = SurveyLH(1,1); 
tmpTraitMonth = SurveyLH(1,2);
tmpTraitDay = SurveyLH(1,3);   
tmpTraitHour = SurveyLH(1,4);

tmpLMHExt = SurveyLH(1,5) ;
tmpLMHAgg = SurveyLH(1,6) ;       
tmpLMHCon = SurveyLH(1,7) ;
tmpLMHEmo = SurveyLH(1,8) ;
tmpLMHCre = SurveyLH(1,9);

k = 1 ;

% Find the consecutive trait changes, to construct the dictionary
% we are interested in the same day change.

for i = 2:surveyLine

    if ( tmpUsr == SurveyLH(i,1) && ...
         tmpTraitMonth == SurveyLH(i,2)   &&...
         tmpTraitDay == SurveyLH(i,3) )
        
    FeatureSetLH{1,1}(k,1) = tmpUsr;
    FeatureSetLH{1,2}(k,1) = tmpTraitMonth ;
    FeatureSetLH{1,3}(k,1) = tmpTraitDay;
    FeatureSetLH{1,4}(k,1) = tmpTraitHour; %Starting Hour 
    FeatureSetLH{1,5}(k,1) = SurveyLH(i,4); %Ending Hour 
 
    diffExt = SurveyLH(i,5) - tmpLMHExt;
    diffAgg = SurveyLH(i,6) - tmpLMHAgg;
    diffCon = SurveyLH(i,7) - tmpLMHCon;
    diffEmo = SurveyLH(i,8) - tmpLMHEmo;
    diffCre = SurveyLH(i,9) - tmpLMHCre;
    
%eXTRAVERT   
    if ( diffExt > 0 )
        %Ascending in Extravert 
      FeatureSetLH{1,6}(k,1) = 'A';   
    elseif ( diffExt == 0 )
        %No Change
      FeatureSetLH{1,6}(k,1) = 'N';   
    elseif (diffExt < 0 )
        %Descending in Extravert 
      FeatureSetLH{1,6}(k,1) = 'D';   
    end
%Aggreableness    
    if ( diffAgg > 0 )
        %Ascending in Extravert 
      FeatureSetLH{1,7}(k,1) = 'A';   
    elseif ( diffAgg == 0 )
        %No Change
      FeatureSetLH{1,7}(k,1) = 'N';   
    elseif (diffAgg < 0 )
        %Descending in Extravert 
      FeatureSetLH{1,7}(k,1) = 'D';   
    end
    
% Consciusness    
    
    if ( diffCon > 0 )
        %Ascending in Extravert 
      FeatureSetLH{1,8}(k,1) = 'A';   
    elseif ( diffCon == 0 )
        %No Change
      FeatureSetLH{1,8}(k,1) = 'N';   
    elseif (diffCon < 0 )
        %Descending in Extravert 
      FeatureSetLH{1,8}(k,1) = 'D';   
    end
 %Emotional Stability   
         
    if ( diffEmo > 0 )
        %Ascending in Extravert 
      FeatureSetLH{1,9}(k,1) = 'A';   
    elseif ( diffEmo == 0 )
        %No Change
      FeatureSetLH{1,9}(k,1) = 'N';   
    elseif (diffEmo < 0 )
        %Descending in Extravert 
      FeatureSetLH{1,9}(k,1) = 'D';   
    end
  %Creativity  
             
    if ( diffCre > 0 )
        %Ascending in Extravert 
      FeatureSetLH{1,10}(k,1) = 'A';   
    elseif ( diffCre == 0 )
        %No Change
      FeatureSetLH{1,10}(k,1) = 'N';   
    elseif (diffCre < 0 )
        %Descending in Extravert 
      FeatureSetLH{1,10}(k,1) = 'D';   
    end
    if (tmpLMHExt == 0 ) && ( SurveyLH(i,5) == 0 )
       FeatureSetLH{1,11}(k,1) = 1;
    elseif (tmpLMHExt == 0 ) && ( SurveyLH(i,5) == 1 )
         FeatureSetLH{1,11}(k,1) = 2;
    elseif (tmpLMHExt == 1 ) && ( SurveyLH(i,5) == 0 )
        FeatureSetLH{1,11}(k,1) = 3;
    elseif (tmpLMHExt == 1 ) && ( SurveyLH(i,5) == 1 )
        FeatureSetLH{1,11}(k,1) = 4;
    end
    
    if ( tmpLMHAgg == 0 ) && ( SurveyLH(i,6) == 0 )
        FeatureSetLH{1,12}(k,1) = 1 ;
    elseif ( tmpLMHAgg == 0 ) && ( SurveyLH(i,6) == 1 )      
        FeatureSetLH{1,12}(k,1) = 2 ;
    elseif ( tmpLMHAgg == 1 ) && ( SurveyLH(i,6) == 0 )      
        FeatureSetLH{1,12}(k,1) = 3 ;   
     elseif ( tmpLMHAgg == 1 ) && ( SurveyLH(i,6) == 1 )      
        FeatureSetLH{1,12}(k,1) = 4 ;
    end
        
  if (tmpLMHCon == 0 ) && (SurveyLH(i,7) == 0 )
      FeatureSetLH{1,13}(k,1) = 1 ;
     elseif (tmpLMHCon == 0 ) && (SurveyLH(i,7) == 1 )
      FeatureSetLH{1,13}(k,1) = 2 ;
       elseif (tmpLMHCon == 1 ) && (SurveyLH(i,7) == 0 )
      FeatureSetLH{1,13}(k,1) = 3 ;
       elseif (tmpLMHCon == 1 ) && (SurveyLH(i,7) == 1 )
      FeatureSetLH{1,13}(k,1) = 4 ;
  end
  
  
 if (tmpLMHEmo == 0 ) && (SurveyLH(i,8) == 0 )
     FeatureSetLH{1,14}(k,1) = 1;
    elseif (tmpLMHEmo == 0 ) && (SurveyLH(i,8) == 1 )
     FeatureSetLH{1,14}(k,1) = 2 ;
      elseif (tmpLMHEmo == 1 ) && (SurveyLH(i,8) == 0 )
     FeatureSetLH{1,14}(k,1) = 3 ;
      elseif (tmpLMHEmo == 1 ) && (SurveyLH(i,8) == 1 )
     FeatureSetLH{1,14}(k,1) = 4 ;
 end
 
 if ( tmpLMHCre == 0 )&& ( SurveyLH(i,9) == 0 )
     FeatureSetLH{1,15}(k,1) = 1 ;
    elseif ( tmpLMHCre == 0 )&& ( SurveyLH(i,9) == 1 )
     FeatureSetLH{1,15}(k,1) = 2 ;
      elseif ( tmpLMHCre == 1 )&& ( SurveyLH(i,9) == 0 )
     FeatureSetLH{1,15}(k,1) = 3 ;
      elseif ( tmpLMHCre == 1 )&& ( SurveyLH(i,9) == 1 )
     FeatureSetLH{1,15}(k,1) = 4 ;
 end    
  
     k = k + 1 ;
     %sometimes they do not fill the survey
    else
        tmpUsr = SurveyLH(i,1); 
        tmpTraitMonth = SurveyLH(i,2);
        tmpTraitDay = SurveyLH(i,3);   
        tmpTraitHour = SurveyLH(i,4);

        tmpLMHExt = SurveyLH(i,5) ;    
        tmpLMHAgg = SurveyLH(i,6) ;       
        tmpLMHCon = SurveyLH(i,7) ;
        tmpLMHEmo = SurveyLH(i,8) ;
        tmpLMHCre = SurveyLH(i,9);
    end
    
    tmpUsr = SurveyLH(i,1);
    tmpTraitMonth = SurveyLH(i,2);
    tmpTraitDay = SurveyLH(i,3);   
    tmpTraitHour = SurveyLH(i,4);

    tmpLMHExt = SurveyLH(i,5) ;
    tmpLMHAgg = SurveyLH(i,6) ;    
    tmpLMHCon = SurveyLH(i,7) ;
    tmpLMHEmo = SurveyLH(i,8) ;
    tmpLMHCre = SurveyLH(i,9) ;

  end
