n=[0:21];
pop=[3.9 5.308 7.24 9.638 12.866 17.069 23.192 31.443 38.558 50.156 62.948 76 91.972 105.711 122.755 131.7 150.7 179.323 203.212 226.505 248.71 281.416];

plot(n,pop,'r*')

dp=zeros(1,21);
for i=1:21;
  dp(i)=pop(1+i)-pop(i);
endfor
dp

pop_n=(390-pop).*pop;
x=pop_n(1:21)
y=dp

model=polyfit(x,dp,1)

ppredict=zeros(1,36);
ppredict(1)=3.9;

for i=1:35;
  ppredict(1+i)=ppredict(i)+model(1)*(390-ppredict(i))*ppredict(i)
endfor
ppredict

nnew=[0:35];

plot(n,pop,'r*',nnew,ppredict,'g*')

newp=zeros(1,36);
newp(1)=3.9;

for i =1:35;
  newp(1+i)=newp(i) +0.000764*(390-newp(i))*newp(i);
endfor

newp


plot(nnew,ppredict,'g*',nnew,newp,'r*')
title('gegegegge','FontSize',20)

y2030=newp(25)
y2040=newp(26)

year2080=newp(28)

