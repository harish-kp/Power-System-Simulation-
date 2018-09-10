clc
clear all
n=input('Enter no of elements');
display('Enter the reactance in order');
z=zeros(n);
for i=1:n
    z(i)=input('');
end
e=1+0i;
f=input('Enter the fault bus');
zf=input('Enter the fault impedance');
z1=0;
z2=0;
for i=1:n;
    if(i<=f)
        z1=z1+z(i);
    else
        z2=z2+z(i);
    end
end
z1
z2
z3=(z1*z2)/(z1+z2);
display(z3);
cf=(e/(z3+zf));
display(cf);
ig1=(cf*z2)/(z1+z2);
display(ig1);
ig2=(cf*z1)/(z1+z2);
display(ig2);
z4=0;
dv=zeros(n);
vf=zeros(n);
for i=1:n-1
    z4=z(i)+z4;
    dv(i)=-(z4*ig1);
end
display(dv);
for i=1:n-1
    vf(i)=1+dv(i);
end
display(vf);
display('Post fault current');
for i=2:n-1
    ip=(vf(i-1)-vf(i))/z(i);
end
scc=-(1*1)/(z3+zf);
display(ip);
display(scc);