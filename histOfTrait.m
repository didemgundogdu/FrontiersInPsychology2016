
vocabSize = 26 ;
j = 0;
histTrait = zeros(vocabSize,2);
for i=1:length(DocWord)
   j = j + 1 ;
    histTrait(j,1) = DocWord(i,2);     
    histTrait(j,2) = histTrait(j,2) + DocWord(i,3);
    j = mod(j, vocabSize) ;
end