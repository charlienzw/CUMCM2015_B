%求出补贴对应需求量增加率
clear all
clc
xqz=zeros(24,1);
for k=1:24
    xq=xlsread('D:\数模国赛\数据\需求量.xlsx',k);
    xqz(k)=sum(xq(:,3));
end
i0=xqz/(12115*65);
i=zeros(24,8);
for k=1:24
    for t=1:8
        if t==1
            omg=10;
            dt=1;
        end
        if t==2
            omg=16;
            i0(k)=i(k,1);
            dt=1;
        end
        if t==3
            omg=10;
            i0(k)=i(k,2);
            dt=1;
        end
        if t==4
            omg=4;
            i0(k)=i(k,3);
            dt=1;
        end
        if t>=5&&t<=8
            omg=0;
            i0(k)=i(k,4);
            dt=t-4;
        end
        lamda=0.1+0.01*omg;
        i(k,t)=1/(1+(1/i0(k)-1)*exp((-1)*lamda*dt));
    end
end        

