clear all
clc
temp=0;
t=0;
alpha=input('Enter the acceleration factor');
err=1;
tol=5e-5;
iter=1;
n=input('Enter no of buses');
v=ones(n,1);
p=zeros(n,1);
q=zeros(n,1);
%get Ybus
for i= 1:n
    for j=1:n
        fprintf('Y%d%d=',i,j);
        y(i,j)=input('');
    end 
end
y
i=1;
%get Bus details
v(i)=input('Enter slack bus voltage');
for i=2:n
    fprintf('Enter bus %d details', i);
    type(i)=input('Enter the type of bus: 1 for PQ 2 for PV');
    p(i)=input('p in pu=');
    if type(i)==1
        q(i)= input('q in pu=');
    else
        v(i)=input('v in pu=');
    end
end
while((err>tol)&&(iter<8))
    display('iter no=');
    iter 
    vold=v;
    for i=2:n
        if type(i)==1
            for j=1:n
                if j~=i
                    temp= temp+(v(j)*y(i,j));
                    t= t+y(i,j);
                end
            end
            s(i)=complex(p(i),q(i));
            v(i)=(((-1*(s(i)))/conj(v(i)))+temp)/t;
            temp=0;
            t=0;
        else
            for j=1:n
                if j~=i
                    temp=temp+(v(j)*y(i,j));
                    t=t+y(i,j);
                end
            end
            q(i)=-imag(conj(v(i))*((v(i)*t)-temp));
            temp=0;
            t=0;
            for j=1:n
                if j~=i
                    temp=temp+(v(j)*y(i,j));
                    t=t+y(i,j);
                end
            end
            s(i)=complex(p(i),q(i));
            cv=(-1*s(i))/(conj(v(i)));
            vang=((cv+temp)/t);
            delta=angle(vang);
            vreal=abs(v(i))*cos(delta);
            vimag=abs(v(i))*sin(delta);
            v(i)=complex(vreal,vimag);
            temp=0;
            t=0;
        end
    end
    v=vold+(alpha*(v-vold));
    vabs=abs(v-vold);
    err=max(vabs);
    fprintf('Voltages after iteration %d',iter);
    v
    iter=iter+1;
end
fprintf('Convergence is reached in iteration %d',iter-1);
display('Voltage after convergence=');
v
for i=1:n
    for j=1:n
        if i~=j
            I(i,j)=y(i,j)*(v(i)-v(j));
            sf(i,j)=-100*v(i)*conj(I(i,j));
        end
    end
end
for i=1:n
    for j=1:n
        if i~=j
            fprintf('Current in line %d %d',i,j);
            I(i,j)
        end
    end
end
for i=1:n
    for j=1:n
        if i~=j
            fprintf('Power flow in line %d %d',i,j);
            sf(i,j)
        end
    end
end