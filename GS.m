clear all
clc	
n=input(' enter no of buses:');
for a=1:n
    for j=a+1:n
        fprintf('enter the admittance between bus %d & bus %d:',a,j);
        b(a,j)=input(' ');
        b(j,a)=b(a,j);
    end
end
for a=1:n
    for j=1:n
        if(a~=j)
            b(a,a)=b(a,a)+b(a,j);
            y(a,j)=-b(a,j);
        end
    end
    y(a,a)=b(a,a);
end
fprintf('\n y bus is:\n');
disp(y)
h=input('enter the alpha value:');
r=input('enter the no of iterations:');
for a=1:n
        fprintf('enter the voltage value %d:', a);
v(a)=input(' ');
end
        disp(v)
        for a=1:n
                display('1.slack bus 2.PV bus 3.PQ bus');
        d=input('enter the number:');
        if(d==1)
            s(a)=input('enter the angle of slack bus:');
        end
                if(d==2)
                    q1=input('enter the minimum limit of reactive power:');
        q2=input('enter the maximum limit of reactive power:');
        P(a)=input('enter the real power of the PV bus:');
        for f=1:r
                T=0;
                t=0;
        for k=1:a-1
                T=T+(y(a,k)*v(k));
        end
                for k=a:n
                        t=t+(y(a,k)*v(k));
end
                        g=conj(v(a))*(t+T);
Q(a)=-imag(g);
fprintf(' the reactive power value of PV as %f\n:',Q(a));
end
        if Q(a)<q1||Q(a)>q2
        for f=1:r
                T=0;
                t=0;
                for k=1:a-1
                        T=T-(y(a,k)*v(k));
                end
                        for k=a+1:n
                                t=t-(y(a,k)*v(k));
                        end
                                v(a)=(1/y(a,a))*(((P(a)-Q(a)*i)/conj(v(a)))+(t+T));
                        end
                                v(a)
        else
            for f=1:r
                    T=0; 
                    t=0;
                    for k=1:a-1
                            T=T-(y(a,k)*v(k));
                    end
                            for k=a+1:n
                                    t=t-(y(a,k)*v(k));
                            end
                                    w(a)=(1/y(a,a))*(((P(a)-i*Q(a))/conj(v(a))+(t+T)));
                            sv(a)=w(a)-v(a);
                            v(a)=v(a)+h*sv(a);
                            v(a)
                            s(a)=angle(w(a));
                            end
                                    end
                                    end
                                    if(d==3)
                                        P(a)=input(' enter the real power of PQ bus:');
                            Q(a)=input('enter the reactive power of PQ bus:');
                            for f=1:r
                                    T=0;
                            t=0;
                            for k=1:a-1
                                    T=T+(y(a,k)*v(k));
                            end
                                    
                                    for k=a+1:n
                                            t=t+(y(a,k)*v(k));
                                    end
                                            x(a)=((-P(a))-(-Q(a)*i))/conj(v(a));
                                    w(a)=(1/y(a,a))*(x(a)-(T+t));
                                    sv(a)=w(a)-v(a);
                                    v(a)=v(a)+h*sv(a);
                                    v(a)
                                    s(a)=angle(w(a));
                                    end
                                            end
                                            end
                                            for a=1:n
                                                    for j=1:n
                                                            if(a~=j)
                                                                if(y(a,j))~=0
                                                                        fprintf('current flow through line %d and %d:',a,j)
                                                                        I1=y(a,j)*(v(a)-v(j))
                                                                        I(a,j)=y(a,j)*(v(a)-v(j));
                                                    fprintf('power flow through line %d and %d:',a,j)
                                                    S=v(a)*conj(I1)
                                                    S1(a,j)=v(a)*conj(I(a,j));
                                                                else
                                                                    S1(a,j)=0;
                                                    end
                                                            end
                                                            end
                                                            end
                                                            for a=1:n
                                                                    for j=a+1:n
                                                                            if(a~=j)
                                                                                if(S1(a,j)~=0)
                                                                                    fprintf('power loss in line %d and %d:',a,j)
                                                                                    Sl=S1(a,j)+S1(j,a)
                                                                                    end
                                                                                            end
                                                                                            end
                                                                                            end
