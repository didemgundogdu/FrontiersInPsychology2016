clc;
clear all;
load ('bagofwords2');

% filename1 = 'wordsList.txt';
% fid1 = fopen(filename1);
% words = textscan(fid1,...
%         '%d %q'...
% ,'Delimiter','\t');

filename1 = 'vocabulary.csv';
fid2 = fopen(filename1);
vocabulary = textscan(fid2,...
        '%d %q'...
,'Delimiter',';');

fclose(fid2);


lineNo = length(words{1,1});

tmpdoc =  words{1,1}(1,1) ;
k = 1 ;
A = words{1,2}(1,:);
for i=2:lineNo 
    if tmpdoc == words{1,1}(i); 
   
    A = vertcat(A,words{1,2}(i,:));
    else
%for each document we should do th?s
% words should include the document no as erll
   for j = 1:length(vocabulary{1,1})
      tmpList = [];
      tmpList = find (strcmp(vocabulary{1,2}(j,1),A)  );
      wordCount{k,1}(j,1) = tmpdoc ;
      wordCount{k,2}(j,1) = j ;
      wordCount{k,3}(j,1) = vocabulary{1,2}(j,1); 
      if isempty(tmpList)
              wordCount{k,4}(j,1) = 0 ;  
      else
      wordCount{k,4}(j,1) = length(tmpList(:,1));            
      end
   end

    A = [];
    k = k + 1 ; 
    tmpdoc = words{1,1}(i) ;
  end
end


 for j = 1:length(vocabulary{1,1})
      tmpList = [];
      tmpList = find (strcmp(vocabulary{1,2}(j,1),A)  );
      wordCount{k,1}(j,1) = tmpdoc ;
      wordCount{k,2}(j,1) = j ;
      wordCount{k,3}(j,1) = vocabulary{1,2}(j,1); 
      if isempty(tmpList)
              wordCount{k,4}(j,1) = 0 ;  
      else
      wordCount{k,4}(j,1) = length(tmpList(:,1));            
      end
 end
   
 z =1 ;
 for i = 1:k
 for j = 1:length(vocabulary{1,1})
 DocWord(z,1) = wordCount{i,1}(j,1);
  DocWord(z,2) = wordCount{i,2}(j,1);
   DocWord(z,3) = wordCount{i,4}(j,1);
   z = z + 1 ;
 end
 end
 
 
 dlmwrite('DocWord.txt',DocWord,'delimiter','\t' ,'precision','%d');
 [WS ,DS ] = importworddoccounts('DocWord.txt');
[ WO ] = textread( 'vocab.csv' , '%s' );
 
 %Topic run is starting
 
 %%
% Set the number of topics
T=10; 

%%
% Set the hyperparameters
BETA=0.02;
ALPHA=50/T;

%%
% The number of iterations
N = 1000; 

%%
% The random seed
SEED = 3;

%%
% What output to show (0=no output; 1=iterations; 2=all output)
OUTPUT = 1;

%%
% This function might need a few minutes to finish
tic
[ WP,DP,Z ] = GibbsSamplerLDA( WS , DS , T , N , ALPHA , BETA , SEED , OUTPUT );
toc

%%
% Just in case, save the resulting information from this sample 

   % save 'D4D_SET3Doc_User_PATH_RESULT' WP DP Z ALPHA BETA SEED N S;


%%
% Put the most 7 likely words per topic in cell structure S
[S] = WriteTopics( WP , BETA , WO , 5 , 0.7);
% Just in case, save the resulting information from this sample 

    save 'topicTrait' WP DP Z ALPHA BETA SEED N S;

fprintf( '\n\nMost likely words in the first twenty topics:\n' );

%%
% Show the most likely words in the first ten topics
S( 1:3)  

%%
% Write the topics to a text file
WriteTopics( WP , BETA , WO , 20 , 1.0 , 2 , 'topicTraitChange.txt' );

fprintf( '\n\nInspect the file ''topics_Trait'' for a text-based summary of the topics\n' ); 

 