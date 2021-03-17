a=xlsread('fuzzy.xls');
f=readfis('proj.fis');
for i=1:30
    a(i,4)=evalfis([a(i,1),a(i,2),a(i,3)],f);
end
xlswrite('fuzzy',a);
fp=fopen('ab.txt','w');
for i=1:30
fprintf(fp,'%.2s\n',a(i,4));
end
fclose(fp);