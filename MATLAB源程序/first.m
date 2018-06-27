clear all
clc
v=60;
Su=zeros(301,3,24);
De=zeros(301,3,24);
for k=1:24
    S=xlsread('D:\数模国赛\数据\供应量.xlsx',k);
    for i=1:size(S,1)
        for j=1:size(S,2)
            Su(i,j,k)=S(i,j);
        end
    end
    D=xlsread('D:\数模国赛\数据\需求量.xlsx',k);
    for i=1:size(D,1)
        for j=1:size(D,2)
            De(i,j,k)=D(i,j);
        end
    end
end
%求出每个供应点和需求点间距离
for k=1:24
    map(:,:,k)=get_map(Su(:,:,k),De(:,:,k));
end
for k=1:24
    xlswrite('D:\数模国赛\数据\距离矩阵.xlsx',map(:,:,k),k)
end
%求出5公里内的距离
for k=1:size(map,3)
    map_k=zeros(301,301);
    for j=1:size(map,2)
        for i=1:size(map,1)
            if map(i,j,k)<=5&&map(i,j,k)~=0
                map_k(i,j)=map(i,j,k);
            end
        end
    end
    xlswrite('D:\数模国赛\数据\可行距离矩阵.xlsx',map_k,k)
end
%求出各供应点前往需求点的概率
for k=1:24
    map_kr=xlsread('D:\数模国赛\数据\可行距离矩阵.xlsx',k);
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
    xlswrite('D:\数模国赛\数据\概率矩阵.xlsx',p,k);
end
%每个需求点的供求比和平均等待时间
for k=1:24 
    map_kr0=xlsread('D:\数模国赛\数据\可行距离矩阵.xlsx',k);
    p0=xlsread('D:\数模国赛\数据\概率矩阵.xlsx',k);
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
    xlswrite('D:\数模国赛\数据\供求比.xlsx',b,k);
    xlswrite('D:\数模国赛\数据\平均等待时间.xlsx',t,k);
end
