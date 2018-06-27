%判断是否交叉或变异
function f=ifc(p)
test(1,100)=0;
l=round(100*p);
test(1:l)=1;
n=round(rand*99)+1;
f=test(n);
