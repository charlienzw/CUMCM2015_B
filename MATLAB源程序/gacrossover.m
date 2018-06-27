%½»²æ
function scro=gacrossover(population,seln,pc)
blength=size(population,2);
if ifc(pc)==1
    chb=round(rand*(blength-2))+1;
    scro(1,:)=[population(seln(1),1:chb) population(seln(2),chb+1:blength)];
    scro(2,:)=[population(seln(2),1:chb) population(seln(1),chb+1:blength)];
else
    scro(1,:)=population(seln(1),:);
    scro(2,:)=population(seln(2),:);
end
