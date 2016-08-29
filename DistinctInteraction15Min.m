clc
clear all

load('Ort_Sum_IR_sorted.mat');
lineNoIR = length(Ort_Sum_IR_Sorted);
Ort_Sum_IR_Sorted = sortrows(Ort_Sum_IR_Sorted);
tmpSlice = 0 ;
load('FifteenMinWindows.mat');
%%%%%%%%%%%

%%
i = 1;k = 1 ;
 X = find (FifteenMinWindows(:,1) == Ort_Sum_IR_Sorted(1,1) &...
        FifteenMinWindows(:,2)== Ort_Sum_IR_Sorted(1,3) & ...%month
        FifteenMinWindows(:,3) == Ort_Sum_IR_Sorted(1,4) &... %day
        FifteenMinWindows(:,6) == Ort_Sum_IR_Sorted(1,5) & ...%hour
        FifteenMinWindows(:,7) <= Ort_Sum_IR_Sorted(1,6) );
    
     if ~isempty(X)
    
        X = sort(X,'descend');
        indexline = X(1,1) ;

     tmpSlice = FifteenMinWindows(indexline,7);
      end


W(k,:)  = Ort_Sum_IR_Sorted(1,:);
k = k + 1 ;
for j = 2:lineNoIR 
    
    X = [] ;
    X = find (FifteenMinWindows(:,1) == Ort_Sum_IR_Sorted(j,1) &...
        FifteenMinWindows(:,2)== Ort_Sum_IR_Sorted(j,3) & ...%month
        FifteenMinWindows(:,3) == Ort_Sum_IR_Sorted(j,4) & ... %day
        FifteenMinWindows(:,6) == Ort_Sum_IR_Sorted(j,5) & ...%hour
        FifteenMinWindows(:,7) <= Ort_Sum_IR_Sorted(j,6) ); 
    
    if ~isempty(X)
        
    X = sort(X,'descend');
    indexline = X(1,1) ;

      if tmpSlice ~= FifteenMinWindows(indexline,7)
            FifteenMinWindows(indexline,8) = length(unique(W(:,2)));
            FifteenMinWindows(indexline,9) = length(W(:,1));
                  k= 1 ;
                  W = [] ;
                  W(k,:)  = Ort_Sum_IR_Sorted(j,:);
                  k = k + 1 ;          
                
      else
          W(k,:)  = Ort_Sum_IR_Sorted(j,:);
       
          k = k + 1 ;
      end
         tmpSlice = FifteenMinWindows(indexline,7);
     end
end