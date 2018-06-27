clear all
clc
v=60;
Su=zeros(301,3,24);
De=zeros(301,3,24);
for k=1:24
    S=xlsread('D:\��ģ����\����\��Ӧ��.xlsx',k);
    for i=1:size(S,1)
        for j=1:size(S,2)
            Su(i,j,k)=S(i,j);
        end
    end
    D=xlsread('D:\��ģ����\����\������.xlsx',k);
    for i=1:size(D,1)
        for j=1:size(D,2)
            De(i,j,k)=D(i,j);
        end
    end
end
%���ÿ����Ӧ������������
for k=1:24
    map(:,:,k)=get_map(Su(:,:,k),De(:,:,k));
end
for k=1:24
    xlswrite('D:\��ģ����\����\�������.xlsx',map(:,:,k),k)
end
%���5�����ڵľ���
for k=1:size(map,3)
    map_k=zeros(301,301);
    for j=1:size(map,2)
        for i=1:size(map,1)
            if map(i,j,k)<=5&&map(i,j,k)~=0
                map_k(i,j)=map(i,j,k);
            end
        end
    end
    xlswrite('D:\��ģ����\����\���о������.xlsx',map_k,k)
end
%�������Ӧ��ǰ�������ĸ���
for k=1:24
    map_kr=xlsread('D:\��ģ����\����\���о������.xlsx',k);
    su=zeros(size(map_kr,1));
    p=zeros(size(map_kr,1),size(map_kr,2));
    for i=1:size(map_kr,1)
        for j=1:size(map_kr,2)
            if map_kr(i,j)~=0
                p(i,j)=De(j,3,k)/map_kr(i,j);
                su(i)=su(i)+p(i,j);
            end
        end
    end
    for i=1:size(p,1)
        if su(i)~=0
        p(i,:)=p(i,:)/su(i);
        end
    end
    xlswrite('D:\��ģ����\����\���ʾ���.xlsx',p,k);
end
%ÿ�������Ĺ���Ⱥ�ƽ���ȴ�ʱ��
for k=1:24 
    map_kr0=xlsread('D:\��ģ����\����\���о������.xlsx',k);
    p0=xlsread('D:\��ģ����\����\���ʾ���.xlsx',k);
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
        b(j)=sum(p(:,j).*Su(:,3,k))/De(j,3,k);
        jiedan(j)=sum(p(:,j).*Su(:,3,k).*map_kr(:,j));
        t(j)=jiedan(j)./sum(p(:,j).*Su(:,3,k));
    end
    xlswrite('D:\��ģ����\����\�����.xlsx',b,k);
    xlswrite('D:\��ģ����\����\ƽ���ȴ�ʱ��.xlsx',t,k);
end
