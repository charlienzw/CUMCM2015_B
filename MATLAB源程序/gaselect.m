%Ñ¡Ôñ
function seln=gaselect(x,p)
for i=1:2
    r=rand;
    pr=p-r;
    j=1;
    while pr(j)<0
        j=j+1;
    end
    seln(i)=j;
end
