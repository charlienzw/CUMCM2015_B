%预处理数据
function f=get_num(x)
n=length(x);
k=0;
j=1;
p=0;
for i=1:n
    if x(i)=='['&&x(i+1)=='['
    p=p+1;
    k=0;
    end
    if x(i)>='0'&&x(i)<='9'||x(i)=='.'
        if (x(i-1)<'0'||x(i-1)>'9')&&x(i-1)~='.'
            k=k+1;
            j=1;
        end
        B(k,j,p)=x(i);
        j=j+1;
    end
end
f=B;
