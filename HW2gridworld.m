clear all;
close all;
clc;
%s={}�A14��states
%A:�W�U���k�A4��actions
%P:�����AS�U�A�U�@��action�Oa�A�h�U�@s�Os'�����v
V=zeros(6,6);%�Ҧ��Ȫ��x�}
N=zeros(4,4);%�һݭn�Ȫ��x�}
NL=ones(4,4);%�s��s�e���x�}�A�ΨөM��s����O�_����
k=0;
B=1;
while B

    NL=N;%�NN�s�iNL
    for i=2:5
        for c=2:5
            if i==2%���Xgridworld���N������state
                V(i-1,c)=V(i,c);
            end
            if i==5
                V(i+1,c)=V(i,c);
            end
            if c==2
                V(i,c-1)=V(i,c);
            end
            if c==5
                V(i,c+1)=V(i,c);
            end

            N(i-1,c-1)=0.25*(-1+1*V(i-1,c))+0.25*(-1+1*V(i+1,c))+0.25*(-1+1*V(i,c-1))+0.25*(-1+1*V(i,c+1)); %�p��value
            N(1,1)=0;%���Istate=0
            N(4,4)=0;
        end
    end
    for x=1:4%��Ȧs�J4x4��N�x�}
        for y=1:4
            V(x+1,y+1)=N(x,y);
        end
    end
%     V(1,:)=0;
%     V(6,:)=0;
%     V(:,1)=0;
%     V(:,6)=0;
    k=k+1;%�p��sweep�X��
    %round(N,1);
    %round(V,1);
    
    if N==NL%�p�Gstate�@�˥N����
        B=0;
    end
    
end

               
    