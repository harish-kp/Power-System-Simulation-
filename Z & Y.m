clear all
clc
n=input('Enter the no of buses');
m=input('Enter 1 for impedance and 2 for admittance');
if m==1
    for i=1:n
        for j=i+1:n
            fprintf('Enter the impedance value b/w bus %d and bus %d',i,j);
            z(i,j)=input(' ');
            if(z(i,j)~=0)
                a(i,j)=1/(z(i,j));
                a(j,i)=a(i,j);
            else
                a(i,j)=0;
            end 
        end
    end
end
if m==2
    for i=1:n
        for j=i+1:n
            fprintf('Enter the admittance value b/w bus %d and bus %d',i,j);
            a(i,j)=input(' ');
            a(j,i)=a(i,j);
        end 
    end
end
sh=input('Enter 1 for shunt admittance and 2 for ignoring shunt admittance');
if sh==1
    if m==2
        for i=1:n
            fprintf('Enter the shunt impedance value b/w bus %d and bus %d',i,i);
            z(i,i)=input(' ');
            if(z(i,i)~=0)
                a(i,i)=1/z(i,i);
            else
                a(i,i)=0;
            end
        end
    end
else
end
for i=1:n
    for j=1:n
        if (i~=j)
            a(i,i)=a(i,i)+a(i,j);
            y(i,j)=-a(i,j);
        end
    end
    y(i,i)=a(i,i);
end
fprintf('\n Y BUS is :\n')
disp(y)
remove=input('Enter 1 to remove a node and 2 for exit');
if remove==1
    p=input('Enter the node to be eliminated:');
    if p==n
        for i=1:n-1
            for j=1:n-1
                ynew(i,j)=y(i,j)-((y(i,p)*y(p,j))/y(p,p));
            end
        end
        fprintf('\n The new Y BUS is \n');
        disp(ynew)
    else
        y([p n],:)=y([n p],:);
        y(:,[p n])=y(:,[n p]);
        a=n;
        for i=1:n-1
            for j=1:n-1
                ynew(i,j)=y(i,j)-((y(i,a)*y(a,j))/y(a,a));
            end
        end
    end
    fprintf('\n The new Y BUS is \n')
    disp(ynew)
else
end