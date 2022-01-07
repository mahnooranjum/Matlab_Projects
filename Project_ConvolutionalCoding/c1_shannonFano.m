prev = 1;
code = ['-' '-' '-' '-' '-' "-"];
T.Temp = cumsum(T.Probability);
val = 0.5;
[~,idx] = (min(abs(T.Temp - val)));
split = [prev idx length(T.Temp)];
prev = idx;
code(split(1):split(2)) = append(code(split(1):split(2)), '0');
code(split(1)) = append(code(split(1)), '0');
code(split(2)) = append(code(split(2)), '1');
code(split(2)+1:split(3)) = append(code(split(2)+1:split(3)), '1');
for i=1:3
    val = val/2;
    [~,idx] = (min(abs(T.Temp(prev:end) - val)));
    code(prev+idx) = append(code(prev+idx), '0');
    code(prev+idx+1:end) = append(code(prev+idx+1:end), '1');
    prev = prev+idx;
end

for i=1:length(code)
    disp([T.Character(i) code(i)]);
end