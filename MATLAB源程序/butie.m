%���8���²������ڴ��������Ӱ��仯

clear all
clc
ig=xlsread('D:\��ģ����\����\i(t).xlsx',1);
iq=xlsread('D:\��ģ����\����\i(t).xlsx',2);
ige=[ig(1,:);ig(15,:);ig(19,:)];
iqe=[iq(1,:);iq(15,:);iq(19,:)];
gy=zeros(301,3,3);
xq=zeros(301,3,3);
gy(:,:,1)=xlsread('D:\��ģ����\����\��Ӧ��.xlsx',1);
gy(:,:,2)=xlsread('D:\��ģ����\����\��Ӧ��.xlsx',15);
gy(:,:,3)=xlsread('D:\��ģ����\����\��Ӧ��.xlsx',19);
xq(:,:,1)=xlsread('D:\��ģ����\����\������.xlsx',1);
xq(:,:,2)=xlsread('D:\��ģ����\����\������.xlsx',15);
xq(:,:,3)=xlsread('D:\��ģ����\����\������.xlsx',19);
gq=zeros(301,2,3,8);
for j=1:2
    for t=1:8
        for k=1:3
            for i=1:301
                gq(i,k,t,j)=(j==1)*(gy(i,3,k)+12115*ige(k,t))+(j==2)*(xq(i,3,k)+12115*65*iqe(k,t));
            end
        end
    end
end
for t=1:8
        xlswrite('D:\��ģ����\����\������Ӧ��.xlsx',gq(:,:,t,1),t);
        xlswrite('D:\��ģ����\����\������������.xlsx',gq(:,:,t,2),t);
end
n=1;
for t=1:8
    for k=1:3
        map_k=xlsread('D:\��ģ����\����\�������.xlsx',tr(k));
        for j=1:size(map_k,2)
            for i=1:size(map_k,1)
                if map_k(i,j)>radius(t)
                    map_k(i,j)=0;
                end
            end
        end
        xlswrite('D:\��ģ����\����\��������о������.xlsx',map_k,n)
        n=n+1;
    end
end
for k=1:24
    map_kr=xlsread('D:\��ģ����\����\��������о������.xlsx',k);
    su=zeros(size(map_kr,1));
    p=zeros(size(map_kr,1),size(map_kr,2));
    for i=1:size(map_kr,1)
        for j=1:size(map_kr,2)
            if map_kr(i,j)~=0
                p(i,j)=gq(j,mo_d(k),ceil(k/3),2)/map_kr(i,j);
                su(i)=su(i)+p(i,j);
            end
        end
    end
    for i=1:size(p,1)
        if su(i)~=0
        p(i,:)=p(i,:)/su(i);
        end
    end
    xlswrite('D:\��ģ����\����\��������ʾ���.xlsx',p,k);
end
for k=1:24 
    map_kr0=xlsread('D:\��ģ����\����\��������о������.xlsx',k);
    p0=xlsread('D:\��ģ����\����\��������ʾ���.xlsx',k);
    map_kr=zeros(301,301);
    p=zeros(301,301);
    for i=1:size(map_kr0,1)
        for j=1:size(map_kr0,2)
            map_kr(i,j)=map_kr0(i,j);
        end
    end
    for i=1:size(p0,1)
        for j=1:size(p0,2)
            p(i,j)=p0(i,j);
        end
    end
    jiedan=zeros(1,size(p,2));
    t=zeros(1,size(p,2));
    b=zeros(1,size(p,2));
    for j=1:length(jiedan)
        b(j)=sum(p(:,j).*gq(:,mo_d(k),ceil(k/3),1))/gq(j,mo_d(k),ceil(k/3),2);
        jiedan(j)=sum(p(:,j).*gq(:,mo_d(k),ceil(k/3),1).*map_kr(:,j));
        t(j)=jiedan(j)./sum(p(:,j).*gq(:,mo_d(k),ceil(k/3),1));
    end
    xlswrite('D:\��ģ����\����\���������.xlsx',b,k);
    xlswrite('D:\��ģ����\����\������ƽ���ȴ�ʱ��.xlsx',t,k);
end
for k=1:3
    A=zeros(8,301);
    B=zeros(8,301);
    for t=1:8
        A0=xlsread('D:\��ģ����\����\���������.xlsx',k+3*(t-1));
        B0=xlsread('D:\��ģ����\����\������ƽ���ȴ�ʱ��.xlsx',k+3*(t-1));
        for i=1:length(A0)
             A(t,i)=A0(i);
        end
        for i=1:length(B0)
            B(t,i)=B0(i);
        end
    end
    xlswrite('D:\��ģ����\����\���������(���ϰ棩.xlsx',A,k);
    xlswrite('D:\��ģ����\����\������ƽ���ȴ�ʱ��(���ϰ棩.xlsx',B,k);
end
S=zeros(8,1,3);
for k=1:3
    A0=xlsread('D:\��ģ����\����\���������(���ϰ棩.xlsx',k);
    B0=xlsread('D:\��ģ����\����\������ƽ���ȴ�ʱ��(���ϰ棩.xlsx',k);
    A0=A0';
    B0=B0';
    A=A0;
    B=zeros(size(B0,1),size(B0,2));
    for i=1:size(B0,1)
        for j=1:size(B0,2)
            if B0(i,j)==0||isnan(B0(i,j))==1
                B(i,j)=0;
            else
                B(i,j)=1/B0(i,j);
            end
        end
    end
    a=0;
    b=0;
    for i=1:size(B,1)
        if A(i,1)==0
            a=a+1;
        end
        if B(i,1)==0
            b=b+1;
        end
    end
    subplot(1,3,k);
    
    for j=1:size(B,2)
            S(j,1,k)=(sum(A(:,j))+sum(B(:,j)))/(602-a-b)/2;
    end
    plot(1:8,S(:,1,k),'r');
    hold on
end
for k=1:3
    xlswrite('D:\��ģ����\����\S.xlsx',S(:,:,k),k);
end
