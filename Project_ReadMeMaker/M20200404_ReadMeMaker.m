clear
selpath = uigetdir;
disp(selpath);
prompt= 'Project Title: ';
temp = input(prompt, 's');
readMe = ['# ' temp newline];

prompt= 'Text: ';
temp = input(prompt, 's');
readMe = [readMe '' temp newline];

readMe = [readMe '## ' 'Getting Started' newline];


prompt= 'Getting Started Text: ';
temp = input(prompt, 's');
readMe = [readMe '' temp newline];
prompt= 'Tech: ';
tempT = input(prompt, 's');
prompt= 'Version: ';
tempV = input(prompt, 's');
while(tempV~='z') 
    readMe = [readMe '> ' tempT '== ' tempV newline '>' newline];
    prompt= 'Tech: ';
    tempT = input(prompt, 's');
    prompt= 'Version: ';
    tempV = input(prompt, 's');
end

readMe = [readMe '## ' 'Details' newline];
readMe = [readMe '| File | Information |' newline];
readMe = [readMe '|-------|------------|' newline];

dirlist = dir(selpath);
for i = 1:length(dirlist)
    prompt= dirlist(i).name;
    prompt = [prompt ' '];
    temp = input(prompt, 's');
    if (temp ~= '.')
        readMe = [readMe '| ' prompt ' | ' temp ' | ' newline];
    end
end
savePath = [selpath '/README.md'];
fid = fopen(savePath,'wt');
fprintf(fid, readMe);
fclose(fid);