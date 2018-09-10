clc 
clear all
n=0;
ch=0;
display('Menu');
display('1.Adding Z from new to ref bus');
display('2.Adding Z from new to existing bus');
display('3.Adding Z from existing to ref bus');
display('4.Adding Z b/w 2 existing bus');
while ch~=5
    ch=input('Enter choice');
    if ch==1
        n=n+1;
        h=n;
        z=zeros(n,n);
        y=zeros(n,n);
        display('Enter Z value');
        for a=1:n
            for b=1:n
                z(a,b)=input(' ');
            end
        end
        z
        pause;
    elseif ch==2
        n=n+1;
        for a=1:n-1
            for b=n
                z(a,b)=z(a,n-1);
            end
        end
            for a=n
                for b=1:n-1
                    z(a,b)=z(n-1,b);
                end 
            end
            z(n,n)=input('Enter the Z value');
            for a=n
                for b=n
                    z(a,b)=z(n-1,n-1)+z(a,b);
                end
            end
            z
            pause;
            elseif ch==3
                h=n;
                h=h+1;
                for a=1:h-1
                    for b=1:h-1
                        y(a,b)=z(a,b);
                    end
                end
                for a=1:h-1
                    for b=h
                        y(a,b)=z(a,h-1);
                    end
                end
                for a=h
                    for b=1:h-1
                        y(a,b)=z(h-1,b);
                    end
                end
                y(h,h)=input('Enter the impedance value');
                for a=h
                    for b=h
                        y(a,b)=z(h-1,h-1)+y(a,b);
                    end
                end
                for a=1:h-1
                    for b=1:h-1
                        z(a,b)=y(a,b)-((y(a,h)*y(h,b))/y(h,h));
                    end
                end
                z
                pause;
                elseif ch==4
                    r=input('from bus');
                    c=input('To bus');
                    h=n;
                    h=h+1;
                    for a=1:h-1
                        for b=1:h-1
                            y(a,b)=z(a,b);
                        end
                    end
                    for a=1:h-1
                        for b=h
                            y(a,b)=z(a,r)-z(a,c);
                        end
                    end
                    for a=h
                        for b=1:h-1
                            y(a,b)=z(r,b)-z(c,b);
                        end
                    end
                    y(h,h)=input('Enter the Z value');
                    for a=h
                        for b=h
                            y(a,b)=y(a,b)+y(r,r)+y(c,c)-(2*(y(r,c)));
                        end
                    end
                    for a=1:h-1
                        for b=1:h-1
                            z(a,b)=y(a,b)-((y(a,h)*y(h,b))/y(h,h));
                        end
                    end
                    z
                    pause;
    end
end        