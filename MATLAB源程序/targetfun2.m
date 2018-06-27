function f=targetfun2(x)
i00=0.2064;
 for t=1:8
        if t==1
            omg=10;
            i0=i00;
            dt=1;
        end
        if t==2
            omg=x(1);
            i0=ip(1);
            dt=1;
        end
        if t==3
            omg=x(2);
            i0=ip(2);
            dt=1;
        end
        if t==4
            omg=x(3);
            i0=ip(3);
            dt=1;
        end
        if t==5
            omg=x(4);
            i0=ip(4);
            dt=1;
        end
        if t==6
            omg=x(5);
            i0=ip(5);
            dt=1;
        end
        if t==7
            omg=x(6);
            i0=ip(6);
            dt=1;
        end
        if t==8
            omg=0;
            i0=ip(7);
            dt=1;
        end
        lamda=0.1+0.01*omg;
        ip(t)=1/(1+(1/i0-1)*exp((-1)*lamda*dt));
 end
 f=(ip(8)-i00)/((ip(1)-i00)*10+(ip(2)-ip(1))*x(1)+(ip(3)-ip(2))*x(2)+(ip(4)-ip(3))*x(3)+(ip(5)-ip(4))*x(4)+(ip(6)-ip(5))*x(5)+(ip(7)-ip(6))*x(6));
