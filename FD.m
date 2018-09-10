clc
clear all
n= input('No of buses');
z=zeros(n,n);
y=zeros(n,n);
display('Admittance');
for a=1:n
    for b=1:n
        y(a,b)=input('');
    end
end
display(y);
for i=1:n
    fprintf('Enter the P & Q values of bus %d',i);
    s1(i)=input('');
end
for i=1:n
    fprintf('Enter the V of bus %d',i);
    v(i)=input('');
end
ps=real(s1);
qs=imag(s1);
for c=1:n
    for d=1:n
        mag(c,d)=abs(y(c,d));
        phangle(c,d)=angle(y(c,d));
    end
end
display(mag);
display(phangle);
magv=abs(v);
vangle=angle(v);
a1=zeros(n,n);
for m=2:3
    for n=2:3
        a1(m,n)=mag(m,n)*(sin(phangle(m,n)));
    end
end
display(a1);
a2=a1(2:3,2:3);
display(a2);
bp=inv(a2);
display(bp);
BP=zeros(n);
BP=a2(2:2,2:2);
display(BP);
BP1=inv(BP);
display(BP1);
p=zeros(n);
for j=2:n
    for k=1:n
        p(j)=p(j)+(magv(j)*magv(k)*mag(j,k)*(cos((phangle(j,k)))));
    end
end
pp=zeros(n);
pp=p(2:3);
ps1=ps(1,2:3);
delp1=ps1-pp;
display(delp1);
magv1=magv(1,2:3);
delpv=zeros(n-1);
delpv(1,1)=delp1(1,1)/magv1(1,1);
delpv(2,1)=delp1(1,2)/magv1(1,2);
delpv1=delpv(1:2,1);
display(delpv1);
deldel=-(bp*delpv1);
display(deldel);
q1=zeros(n);
j=3
for k=1:3
    q1(j)=q1(j)+(magv(j)*magv(k)*mag(j,k)*(sin(phangle(j,k)-vangle(j)+vangle(k))));
end
q1(1,3)=-q1(3,1);
q1(3,1)=0;
q2=q1(1,:);
delq=qs-q2;
display(delq);
conq=max(abs(delq));
display(conq);
delqyv=conq/magv(1,3);
delv=zeros(n);
delv=-BP1*delqyv;
display(delv);
vnew=zeros(n);
vnew=magv;
vnew(3)=magv(3)+delv;
display(vnew);
vanglenew=zeros(3,1);
vanglenew=deldel;
display(vanglenew);