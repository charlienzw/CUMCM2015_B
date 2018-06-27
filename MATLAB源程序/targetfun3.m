function f=targetfun3(x1,x2)
load map_kr.mat
load p.mat
i001=0.0014;
 for t=1:5
        if t==1
            omg=10;
            i0=i001;
            dt=1;
        end
        if t==2
            omg=x1(1);
            i0=ip1(1);
            dt=1;
        end
        if t==3
            omg=x1(2);
            i0=ip1(2);
            dt=1;
        end
        if t==4
            omg=x1(3);
            i0=ip1(3);
            dt=1;
        end
        if t==5
            omg=0;
            i0=ip1(4);
            dt=1;
        end
        lamda=0.1+0.01*omg;
        ip1(t)=1/(1+(1/i0-1)*exp((-1)*lamda*dt));
 end
 ip1(6)=ip1(5);
 ip1(7)=ip1(5);
 ip1(8)=ip1(5);
i002=0.2064;
 for t=1:8
        if t==1
            omg=10;
            i0=i002;
            dt=1;
        end
        if t==2
            omg=x2(1);
            i0=ip2(1);
            dt=1;
        end
        if t==3
            omg=x2(2);
            i0=ip2(2);
            dt=1;
        end
        if t==4
            omg=x2(3);
            i0=ip2(3);
            dt=1;
        end
        if t==5
            omg=x2(4);
            i0=ip2(4);
            dt=1;
        end
        if t==6
            omg=x2(5);
            i0=ip2(5);
            dt=1;
        end
        if t==7
            omg=x2(6);
            i0=ip2(6);
            dt=1;
        end
        if t==8
            omg=0;
            i0=ip2(7);
            dt=1;
        end
        lamda=0.1+0.01*omg;
        ip2(t)=1/(1+(1/i0-1)*exp((-1)*lamda*dt));
 end
 load gy.mat
 load xq.mat
 gq=zeros(301,24,8,2);
 for j=1:2
    for t=1:8
        for k=1:24
            for i=1:301
                gq(i,k,t,j)=(j==1)*(gy(i,3,k)+12115*ip2(t))+(j==2)*(xq(i,3,k)+12115*65*ip1(t));
            end
        end
    end
end
 B=zeros(8,301);
 T=zeros(8,301);
 for t=1:8
      
     for k=1:24
         t_w=zeros(1,size(p,2));
      b=zeros(1,size(p,2));
      jiedan=zeros(1,size(p,2));
        for j=1:length(jiedan)
        b(j)=sum(p(:,j).*gq(:,k,t,1))/gq(j,k,t,2);
        jiedan(j)=sum(p(:,j).*gq(:,k,t,1).*map_kr(:,j));
        t_w(j)=jiedan(j)./sum(p(:,j).*gq(:,k,t,1));
        if isnan(b(j))==1
            b(j)=0;
        end
        if isnan(t_w(j))==1
            t_w(j)=0;
        end
        end
    B(t,:)=B(t,:)+b;
    T(t,:)=T(t,:)+t_w;
     end
end
B=B./24;
T=T./24;
B=B';
T=T';
for i=1:length(T)
    if T(i)==0&&isnan(T(i))==1
        T(i)=0;
    else
        T(i)=1/T(i);
    end
end
for i=1:301
    for j=1:8
        if B(i,j)==0&&isnan(B(i,j))==1
            B(i,j)=0;
        end
        if T(i,j)==0&&isnan(T(i,j))==1
            T(i,j)=0;
        end
        if B(i,j)==inf
            B(i,j)=0;
        end
        if T(i,j)==inf
            T(i,j)=0;
        end
    end
end
S=(sum(B)+sum(T))/602;
f=sum(S);
