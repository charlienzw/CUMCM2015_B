%ģ������
clear all
clc
gq=xlsread('D:\��ģ����\����\�����.xlsx');
for k=1:24
    ls=gqlishudu(gq(:,k),0.5,3,3.5,6);
    xlswrite('D:\��ģ����\����\�����������.xlsx',ls,k);
end
   
sj=xlsread('D:\��ģ����\����\ƽ���ȴ�ʱ��.xlsx');
for i=1:size(sj,1)
    for j=1:size(sj,2)
        if isnan(sj(i,j))==1
            sj(i,j)=inf;
        end
    end
end
for k=1:24
    ls=sjlishudu(sj(:,k),0.9,1.7,1.8,3);
    xlswrite('D:\��ģ����\����\ƽ���ȴ�ʱ��������.xlsx',ls,k);
end
for k=1:24
    ls1=gqlishudu(gq(:,k),0.5,3,3.5,6);
    ls2=sjlishudu(sj(:,k),0.9,1.7,1.8,3);
    ls_m=max(ls1,ls2);
    xlswrite('D:\��ģ����\����\��������.xlsx',ls_m,k);
end
F=zeros(size(ls_m,1),2,24);
for k=1:24
    ls1=gqlishudu(gq(:,k),0.5,3,3.5,6);
    ls2=sjlishudu(sj(:,k),0.9,1.7,1.8,3);
    ls_m=max(ls1,ls2);
    for i=1:size(ls_m,1)
        [F(i,1,k),F(i,2,k)]=max(ls_m(i,:));
    end
    xlswrite('D:\��ģ����\����\ģ�����۽��.xlsx',F(:,:,k),k);
end
for k=1:24
    jw=xlsread('D:\��ģ����\����\������.xlsx',k);
    subplot(4,6,k);
    for i=1:301
        if F(i,2,k)==1
            sy='r*';
        end
        if F(i,2,k)==2
            sy='g*';
        end
        if F(i,2,k)==3
            sy='b*';
        end
        if jw(i,1)~=0
            scatter(jw(i,1),jw(i,2),sy);
            hold on
        end
    end
end
