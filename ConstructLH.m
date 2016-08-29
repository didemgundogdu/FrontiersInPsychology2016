clc

%Construct LH with the median of the user

clear all;
load('Sum_IR_sorted.mat');
load('TraitCall.mat');
load('TraitDateTime.mat');
%TraitCall{1,9} -> Month
%TraitCall{1,10} -> Day
%%TraitCall{1,11} -> Hour

surveyLine = length(TraitCall{1,1}(:));
tmpUsr = TraitCall{1,1}(1); 
tmpTraitMonth = TraitCall{1,9}(1);
tmpTraitDay = TraitCall{1,10}(1);   
tmpTraitHour = TraitCall{1,11}(1);

tmpExt = TraitCall{1,4}(1) ;
tmpAgg = TraitCall{1,5}(1) ;       
tmpCon = TraitCall{1,6}(1) ;
tmpEmo = TraitCall{1,7}(1) ;
tmpCre = TraitCall{1,8}(1) ;
k = 1 ;
j = 1 ;

% Find the median value of each trait for each user
UserVector = zeros(1,6,'double');
medianPerUser = zeros(1,6,'double');
for i = 1:surveyLine

    if tmpUsr == TraitCall{1,1}(i,1) 
      
        UserVector(j,1) = tmpUsr;
        UserVector(j,2) = double(TraitCall{1,4}(i,1)) ;
        UserVector(j,3) = double(TraitCall{1,5}(i,1)) ;
        UserVector(j,4) = double(TraitCall{1,6}(i,1)) ;
        UserVector(j,5) = double(TraitCall{1,7}(i,1)) ;
        UserVector(j,6) = double(TraitCall{1,8}(i,1)) ;
        
        j = j + 1 ;
    else
  
        medianPerUser(k,1) = tmpUsr;
      
        medianPerUser(k,2) = median(UserVector(:,2));
        medianPerUser(k,3) = median(UserVector(:,3));
        medianPerUser(k,4) = median(UserVector(:,4));
        medianPerUser(k,5) = median(UserVector(:,5));
        medianPerUser(k,6) = median(UserVector(:,6));
        k = k + 1;
        j = 1 ;
        UserVector = [];      
    end
    tmpUsr = TraitCall{1,1}(i,1) ;
end
        medianPerUser(k,1) = tmpUsr;
        medianPerUser(k,2) = median(UserVector(:,2));
        medianPerUser(k,3) = median(UserVector(:,3));
        medianPerUser(k,4) = median(UserVector(:,4));
        medianPerUser(k,5) = median(UserVector(:,5));
        medianPerUser(k,6) = median(UserVector(:,6));
k = 1 ;
    for i=1:surveyLine
    
    x = find(TraitCall{1,1}(i,1) == medianPerUser(:,1));
       
    SurveyLH(k,1) = TraitCall{1,1}(i,1);
    SurveyLH(k,2) =TraitCall{1,9}(i);
    SurveyLH(k,3) = TraitCall{1,10}(i);
    SurveyLH(k,4) = TraitCall{1,11}(i);

%eXTRAVERT   

        if medianPerUser(x,2) <= TraitCall{1,4}(i) 
       SurveyLH(k,5) = 1 ;
        else
       SurveyLH(k,5) = 0 ;
        end
  
%Aggreableness    
       if medianPerUser(x,3) <= TraitCall{1,5}(i) 
       SurveyLH(k,6) = 1 ;
        else
       SurveyLH(k,6) = 0 ;
        end
% Consciusness    
    
        if medianPerUser(x,4) <= TraitCall{1,6}(i) 
       SurveyLH(k,7) = 1 ;
        else
       SurveyLH(k,7) = 0 ;
        end
 %Emotional Stability   
         
        if medianPerUser(x,5) <= TraitCall{1,7}(i) 
       SurveyLH(k,8) = 1 ;
        else
       SurveyLH(k,8) = 0 ;
        end
  %Creativity  
        if medianPerUser(x,6) <= TraitCall{1,8}(i) 
       SurveyLH(k,9) = 1 ;
        else
       SurveyLH(k,9) = 0 ;
        end
     k = k + 1 ;
    end
  
