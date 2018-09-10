clear all
clc
n=input('Enter the number of buses');
y=zeros(n,n);
display('Enter the admittance values');
for i=1:n
    for j=1+i:n
        fprintf('Enter the admittance value b/w bus %d and %d',i,j);
        a(i,j)=input('');
        a(j,i)=a(i,j);
    end
end
for i=1:n
    fprintf('Enter the half line charging admittance value for bus %d',i);
    a(i,i)=input('');
end
for i=1:n
    for j= 1:n
        if(i~=j)
            a(i,i)=a(i,i)+a(i,j);
            y(i,j)=-a(i,j);
        end
    end
    y(i,i)=a(i,i);
end
y
ymag=abs(y)
yangle=angle(y)
a=input('Enter the number of iterations');
for i=1:n
    v(i)=input('Enter the input voltage');
    vmag=abs(v);
    vangle=angle(v);
end
vmag
vangle
for i=1:a
    j=1;
    for j=1:n-1
        j=j+1;
        p(j)=0;
        for k=1:n
            p(j)=p(j)+(abs(v(j))*abs(v(k))*abs(y(j,k))*cos(angle(y(j,k))+angle(v(k))-angle (v(j))));
        end
        p(j)
        q(j)=0;
        for k=1:n
            q(j)=q(j)+(abs(v(j))*abs(v(k))*abs(y(j,k))*sin(angle(y(j,k))+angle(v(k))-angle (v(j))));
        end
        q(j)=-q(j);
        q(j)
        c=input('Enter 1 for PV bus');
        if(c==1)display('Enter the input in per unit value');
            pspec=input('Enter the real power');
            delp=pspec-p(j);
            q1=input('Enter the minimum value of reactive power');
            q2=input('Enter the maximum value of reactive power');
            if(q(j)<q1||q(j)>q2)
                if(q(j)<q1)
                    qspec=q1
                    fprintf('Now %lf bus will act as a load bus',j);
                    v(j)=1+0i;
                else
                    qspec=q2;
                end
            end
            delq=qspec-q(j);
        else
            display('Enter the input in per unit value');
            pspec=input('Enter the real power');
            delp=pspec-p(j);
            qspec=input('Enter the reactive power');
            delq=qspec-q(j);
        end
    end
    J1=0;
    J2=0;
    J3=0;
    J4=0;
    T=0;
    t=0;
    display('The diagonal and off diagonal elements of J1');
    for k=1:n
        if k~=j
            J1=J1+(abs(v(j))*abs(v(k))*abs(y(j,k))*sin(angle(y(j,k))+angle(v(k))-angle (v(j))));
        end
    end
    J1
    display('The diagonal and off diagonal elements of J2');
    for k=1:n
        if k~=j
            T=T+(abs(v(j))*abs(v(k))*abs(y(j,k))*cos(angle(y(j,k))+angle(v(k))-angle (v(j))));
        end
        J2=2*abs(v(j))*abs(y(j,k))*cos(angle(y(j,j)))+T;
    end
    J2
    display('The diagonal and off diagonal elements of J3');
    for k=1:n
        if k~=j
            J3=J3+(abs(v(j))*abs(v(k))*abs(y(j,k))*cos(angle(y(j,k))+angle(v(k))-angle (v(j))));
        end
    end
    J3
    display('The diagonal and off diagonal elements of J4');
    for k=1:n
        if k~=j
            t=t+(abs(v(j))*abs(v(k))*abs(y(j,k))*sin(angle(y(j,k))+angle(v(k))-angle (v(j))));
        end
        J4=(-2*abs(v(j))*abs(y(j,k))*sin(angle(y(j,j))))-t;
    end
    J4
    J=zeros(n,n)
    J=[J1 J2;J3 J4]
    Jinv= inv(J)
    pq=[delp;delq]
    delx=Jinv*pq
    x=[angle(v(j));abs(v(j))];
    x
    newx=x+delx;
    newx
end