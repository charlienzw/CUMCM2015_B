%«Ûµ√æ‡¿Îæÿ’Û
function f=get_map(Su,De)
f=zeros(size(Su,1),size(De,1));
ke=111.31955;
for i=1:size(f,1)
    for j=1:size(f,2)
        if sum(Su(i,:)==zeros(1,3))||sum(De(j,:)==zeros(1,3))
            f(i,j)=0;
        else
            f(i,j)=abs((De(j,1)-Su(i,1))*ke*cos(Su(i,2)/pi))+abs(De(j,2)-Su(i,2))*ke;
        end
    end
end
