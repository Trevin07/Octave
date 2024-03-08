#non linear predator_prey_ode
fn=zeros(1,501);
rn=zeros(1,501);
fn(1)=110;
rn(1)=900;

for i =1:500
  fn(1+i)=0.88*fn(i) +0.0001*fn(i)*rn(i);
  rn(1+i)=-0.0003*fn(i)*rn(i) +1.039*rn(i);
endfor

fn
rn

n=[0:500]

figure(1)
plot(n,fn,'r-',n,rn,'b-')
title('Time Plots','FontSize',20)

figure(2)
plot(fn,rn,'g*')
title('Trajectory','FontSize',18)

