clear all
clc
%�����ƽ̨�Ĺ�Ӧ��������������
A='�ڴ�����ԭʼ����';
F=get_num(A);
cnt=size(F,1)/3;
K=zeros(cnt,3);
for k=1:size(F,3)
    j=1;
    for i=1:size(F,1)
        if isempty(str2num(F(i,:,k)))==0
            if mod(i,3)==1
                K(j,1)=str2num(F(i,:,k));
            end
            if mod(i,3)==2
                K(j,2)=str2num(F(i,:,k));
            end
            if mod(i,3)==0
                K(j,3)=str2num(F(i,:,k));
                j=j+1;
            end
        end
    end
xlswrite('D:\��ģ����\����\��������.xlsx',K,k)
end
