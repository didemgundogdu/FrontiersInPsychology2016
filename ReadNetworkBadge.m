%Load badge Data
%NewId - File is moved manually to IR_ID_Change 
%154 and 300 assigned to 507
clc;
clear all;

filename1 = 'survey_with_traits_date.txt';
fid1 = fopen(filename1);

TraitCall = textscan(fid1,...
    '%d %q %q %d %d %d %d %d'...
,'Delimiter',',','HeaderLines',1);

fclose(fid1);

filename2 = 'sync_ir_preprocessed.txt';
fid2 = fopen(filename2);
IR = textscan(fid2,...
    '%d %d %q %d %d'...
,'Delimiter',',','HeaderLines',1);

fclose(fid2);


lineNoTrait = length(TraitCall{1,1});
NewList = zeros(lineNoTrait,2);
tmpUsr = TraitCall{1,1}(1);
tmpDate = TraitCall{1,3}(1);

for i=2:lineNoTrait
    
    if tmp
    strfind(tmpDate{1,1},'2012')
    
    
	
    
    X = 0;Y = 0;
   [X,Y] = find(IR{1,1}(i)== sortedID());   
   NewList(i,1) = sortedID(X,2);
   X = 0;Y = 0;
   [X,Y] = find(IR{1,2}(i)== sortedID());   
   NewList(i,2) = sortedID(X,2);
   tmp = IR{1,3}(i);
   % Take the first 10 char of timestamp coming from the file
   NewListDate{1,1}(i)= cellstr(tmp{1,1}(1:10));
end
