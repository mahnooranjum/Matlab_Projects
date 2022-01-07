function Pr = get_pr_cell(Pt, Pl, factor)
Pl_temp =10^((Pl)/10);
Pt = db2pow(Pt);
Pr = Pt / Pl_temp;
% add fading 
Pr = Pr * factor;
end