
% Document is users
% document is constructed for each day consequtive interaction
% Experiment set 2 t-1 effect

clc
clear all;
load('FeatureSet.mat');
load('Sum_IR_sorted.mat');
load('TraitDateTime.mat');
k = 1 ;

DateTimeTable(:,1) = FeatureSet{1,1}(:);
DateTimeTable(:,2) = FeatureSet{1,2}(:);
DateTimeTable(:,3) = FeatureSet{1,3}(:);
DateTimeTable(:,4) = FeatureSet{1,4}(:);
for i=1:length(DateTimeTable)
DateTimeTable(i,5)= i;
end

DateTimeTable = sortrows(DateTimeTable,[1,2,3,4]);

tmpUserThis = 0;
tmpUserAlter = 0 ;

for i=1:length(Sum_IR_Sorted(:,1))    
 % if tmpUserThis ~= Sum_IR_Sorted(i,1)
      X1 = 0;
   [X1,Y] =  find(DateTimeTable(:,1) == Sum_IR_Sorted(i,1)...
       & DateTimeTable(:,2)== Sum_IR_Sorted(i,3) & ...
        DateTimeTable(:,3) == Sum_IR_Sorted(i,4) & ...
        DateTimeTable(:,4) >= Sum_IR_Sorted(i,5)  );
    if ~isempty(X1)
    wordSequence{1,1}(k,1)= Sum_IR_Sorted(i,1) ;
    wordSequence{1,2}(k,1)= FeatureSet{1,5}(DateTimeTable(X1(1),5),1);
    wordSequence{1,3}(k,1)= FeatureSet{1,5}(DateTimeTable(X1(1),5),3);
    end
%   elseif ~isempty(X1)
%     wordSequence{1,1}(k,1)= Sum_IR_Sorted(i,1) ;
%     wordSequence{1,2}(k,1)= FeatureSet{1,5}(DateTimeTable(X1(1),5)); 
%     this_flg = 0 ;
%   end
  
    X2 = 0;    
    alter_flg = 0 ;

   [X2,Y] =  find(DateTimeTable(:,1)== Sum_IR_Sorted(i,2)...
       & DateTimeTable(:,2)== Sum_IR_Sorted(i,3) & ...
        DateTimeTable(:,3) == Sum_IR_Sorted(i,4) & ...
        DateTimeTable(:,4) >= Sum_IR_Sorted(i,5)  );
    if ~isempty(X2)
        %the last digit show the effect from alter_id 
        % 1 - > Ascending / Descending / Neutral
        % 2 - > t-1 effect ( L - M - H )
        % 3 - > t effect
    wordSequence{1,4}(k,1)= FeatureSet{1,5}(DateTimeTable(X2(1),5),3);
    end
      k = k + 1 ;
   tmpUserThis = Sum_IR_Sorted(i,1)  ;
   tmpUserAlter = Sum_IR_Sorted(i,2) ;
end
z = 1 ;
for i =1:length(wordSequence{1,1})
 if (wordSequence{1,1}(i) == 0 )  ||  (wordSequence{1,2}(i,1) == 0) ...
      ||  (wordSequence{1,4}(i,1) == 0 ) 
 else
   W{1,1}(z,1) =  wordSequence{1,1}(i)  ;
   W{1,2}(z,1) =  wordSequence{1,2}(i)  ;
   W{1,3}(z,1) =  wordSequence{1,3}(i)  ;
   W{1,4}(z,1) =  wordSequence{1,4}(i)  ;
   z = z + 1 ;
 end
  
end
 words{1,1} = W{1,1};
 words{1,2} = horzcat(W{1,2},W{1,3},W{1,4});

vocb =  unique(words{1,2},'rows');

% Words = horzcat(FeatureSet{1,5},FeatureSet{1,6},FeatureSet{1,7},...
%     FeatureSet{1,8},FeatureSet{1,9});

%c);


