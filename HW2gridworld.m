clear all;
close all;
clc;
%s={}，14個states
%A:上下左右，4個actions
%P:此狀態S下，下一個action是a，則下一s是s'的機率
V=zeros(6,6);%所有值的矩陣
N=zeros(4,4);%所需要值的矩陣
NL=ones(4,4);%存更新前的矩陣，用來和更新後比對是否收斂
k=0;
B=1;
while B

    NL=N;%將N存進NL
    for i=2:5
        for c=2:5
            if i==2%走出gridworld的就維持原state
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

            N(i-1,c-1)=0.25*(-1+1*V(i-1,c))+0.25*(-1+1*V(i+1,c))+0.25*(-1+1*V(i,c-1))+0.25*(-1+1*V(i,c+1)); %計算value
            N(1,1)=0;%終點state=0
            N(4,4)=0;
        end
    end
    for x=1:4%把值存入4x4的N矩陣
        for y=1:4
            V(x+1,y+1)=N(x,y);
        end
    end
%     V(1,:)=0;
%     V(6,:)=0;
%     V(:,1)=0;
%     V(:,6)=0;
    k=k+1;%計算sweep幾次
    %round(N,1);
    %round(V,1);
    
    if N==NL%如果state一樣代表收斂
        B=0;
    end
    
end

               
    