%平均等待时间的隶属度函数
function f=sjlishudu(X,a,b,c,d)
f=zeros(length(X),3);
for i=1:length(X)
    if X(i)<=a
       f(i,1)=1;
       f(i,2)=0;
       f(i,3)=0;
    end
    if X(i)>a&&X(i)<=b
        f(i,1)=(d-X(i))/(d-a);
        f(i,2)=(X(i)-a)/(b-a);
        f(i,3)=(X(i)-a)/(d-a);
    end
    if X(i)>b&&X(i)<=c
        f(i,1)=(d-X(i))/(d-a);
        f(i,2)=1;
        f(i,3)=(X(i)-a)/(d-a);
    end
    if X(i)>c&&X(i)<=d
       f(i,1)=(d-X(i))/(d-a);
       f(i,2)=(d-X(i))/(d-c);
       f(i,3)=(X(i)-a)/(d-a);
    end
    if X(i)>d
        f(i,1)=0;
        f(i,2)=0;
        f(i,3)=1;
    end
end
