list = dir
isdirout = [list.isdir];
names = {list(isdirout).name}
for i=3:length(names)
    name = string(names(i));
    cd(name)
    !git pull origin master
    cd ..
end
