clear;
html= urlread('https://www.forex.pk/currency-usd-to-pkr-to-us-dollar.php');
text = 'data: [';
indexStr = strfind(html,text);
str = string(html(indexStr:indexStr+200));
expression = '\[(.*?)\]';
[match,noMatch] = regexp(str,expression,'match','split','forceCellOutput');
match = string(match);
match = erase(match,"[");
match = erase(match,"]");
match = strtrim(match);
matchCells = regexp(match, ',', 'split');
pkr2usd = str2num(matchCells(end));

usd = input('Enter the amount in USD: ', 's');
pkr = str2num(usd) * pkr2usd;
disp(append(usd,'PKR = ',string(pkr),'USD'));