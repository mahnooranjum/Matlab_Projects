clear
list = dir
isdirout = [list.isdir];
names = {list(isdirout).name}
for i=3:length(names)
    name = string(names(i))
    prompt= '(z commit remove, x cancel): ';
    temp = input(prompt, 's');
    if (temp=='x')
        break
    end
    if (~strcmp(temp, 'z'))
       cd(name)
       !git checkout --orphan temp_branch
       !git add -A
       !git commit -am "first commit"
       !git branch -D master
       !git branch -m master
       !git push -f origin master
       cd ..    
    end
end
