
load('GraphletFeature');
GraphletFeature = sortrows(GraphletFeature,[1,2,3,4,5]);
k = 1 ;
sumSurvey(k,1:5) = GraphletFeature(1,1:5);
sumSurvey(k,6:125) = GraphletFeature(1,13:132);

for i=2:length(GraphletFeature(:,1)) 

    if (GraphletFeature(i,1) == sumSurvey(k,1) && ...
         GraphletFeature(i,2) == sumSurvey(k,2) && ...
         GraphletFeature(i,3) == sumSurvey(k,3) && ... 
         GraphletFeature(i,4) == sumSurvey(k,4) && ...
         GraphletFeature(i,5) == sumSurvey(k,5)...
    )
    sumSurvey(k,6:125) = sumSurvey(k,6:125) + GraphletFeature(i,13:132);
    else
        k = k + 1 ;
sumSurvey(k,1:5) = GraphletFeature(i,1:5);
sumSurvey(k,6:125) = GraphletFeature(i,13:132);
    end
end

sumSurvey(k,6:125) = sumSurvey(k,6:125) + GraphletFeature(i,13:132);