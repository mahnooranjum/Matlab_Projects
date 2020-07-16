list = dir
isdirout = [list.isdir];
names = {list(isdirout).name}
for i=3:length(names)
    name = string(names(i));
    cd(name)
    !git add *
    !git commit -m "Added readMe"
    !git push origin master
    cd ..
end
