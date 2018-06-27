function f=targetfun1(x)
i00=0.0014;
 for t=1:5
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
            omg=0;
            i0=ip(4);
            dt=1;
        end
        lamda=0.1+0.01*omg;
        ip(t)=1/(1+(1/i0-1)*exp((-1)*lamda*dt));
 end
 f=(ip(5)-i00)/((ip(1)-i00)*10+(ip(2)-ip(1))*x(1)+(ip(3)-ip(2))*x(2)+(ip(4)-ip(3))*x(3));
