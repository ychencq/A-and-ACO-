function [flag,targetInd]=FindList(m,open,close)
%{
函?功能：
如果相��?��(m存?其信息)  已�r在Closelist中，?flag = 1  targetInd = 其所在close的行?，用?定位
如果相��?��(m存?其信息)    不在Openlist 中，?flag = 2  targetInd = []
如果相��?��(m存?其信息)  已�r在Openlist 中，?flag = 3  targetInd = 其所在open的行?，用?定位
%}

%如果openlist?空，?一定不在openlist中
if  isempty(open)
    flag = 2;
    targetInd = [];
    
else  %open不?空?，需要?查是否在openlist中
    %遍?openlist，?查是否在openlist中
    for io = 1:length(open(:,1))
        if isequal(  m(1:2) , open(io,1:2)  )  %在Openlist中
            flag = 3;
            targetInd = io;
            return;
        else  %不在Openlist中
            flag = 2;
            targetInd = [];
        end
    end
end

%如果能到?一步，?明：  一定不在Openlist中    那么需要判?是否在closelist中

%遍?Closelist（注意closelist不可能?空）
for ic = 1:length(close(:,1))
    if isequal(  m(1:2) , close(ic,1:2)  )  %在Closelist中
        flag = 1;
        targetInd = ic;
        return;%在Closelist中直接return
    end
end

end










%{
以下代?用于??此函?的正确性：
open = [ 1,1 ; 2,2; 3,3; 4,4; 5,5; 6,6; 7,7; 8,8; 9,9];
%?有一种情�G：open列表?空
close = [1,2 ; 2,3; 3,4; 4,5; 5,6; 6,7; 7,8];

m1 = [5,6]; %在close中 此?flag??1 targetInd ?? 5
m2 = [0,0]; %不在open中， 此?flag??2 targetInd ??空[]
m3 = [3,3]; %在open中 此?flag??3  targetInd ?? 3

[flag,targetInd] = FindList(m1,open,close)  %flag = 1 targetInd = 5
[flag,targetInd] = FindList(m2,open,close)  %flag = 2 targetInd = []
[flag,targetInd] = FindList(m3,open,close)  %flag = 3 targetInd = 3
%}
