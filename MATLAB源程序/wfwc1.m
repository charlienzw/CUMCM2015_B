%求出补贴对应供应量增加率
clear all
clc
gyz=zeros(24,1);
for k=1:24
    gy=xlsread('D:\数模国赛\数据\供应量.xlsx',k);
    gyz(k)=sum(gy(:,3));
end
i0=gyz/12115;
i=zeros(24,8);
for k=1:24
    for t=1:8
        if t>=1&&t<=6
            omg=10;
            dt=t;
        end
        if t==7
            omg=2;
            i0(k)=i(k,6);
            dt=1;
        end
        if t==8
            omg=0;
            i0(k)=i(k,7);
            dt=1;
        end
        lamda=0.1+0.01*omg;
        i(k,t)=1/(1+(1/i0(k)-1)*exp((-1)*lamda*dt));
    end
end
