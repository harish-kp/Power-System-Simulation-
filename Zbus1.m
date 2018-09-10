clear all
clc
w=0;
x=1;
n=input('Enter the number of bus');
while(x~=5)
    w=w+1;
    display('Main Menu');
    display('1. Add element between new bus and ref bus');
    display('2. Add element between new bus and existing bus');
    display('3. Add element between existing bus and ref bus');
    display('4. Add element between existing bus to existing bus');
    display('5. exit');
    ch=input('Enter the choice\n');
    switch(ch)
        case 1
            a=input('Enter the new bus number\n');
            z(w,w)=input('Enter the impedance\n');
            z
        case 2
            b=input('Enter the existing bus number\n');
            c=input('Enter the new bus number\n');
            z1=input('Enter the impedance\n');
         for i=1:w-1
          z(i,w)=z(i,b);
          z(w,i)=z(b,i);
           end
           z(w,w)=z(b,b)+z1;
           z

       case 3
            d=input('Enter the existing bus number\n');
            z2=input('Enter the impedance\n');
            for i=1:w-1
                z(i,w)=z(i,d);
                z(w,i)=z(d,i);
            end
           z(w,w)=z(w-1,w-1)+z2;
           for j=1:w-1
               for k=1:w-1
                   zbusnew(j,k)=z(j,k)-(z(j,w)*z(w,k))/z(w,w);
               end
           end   
           w=w-1;
         z=zbusnew
        case 4
            e=input('Enter the first bus\n');
            f=input('enter the second bus\n');
            z3=input('Enter the impedance\n');
            for i=1:w-1
                z(i,w)=z(i,e)-z(i,f);
                z(w,i)=z(e,i)-z(f,i);
            end
            z(w,w)=z3+z(e,e)+z(f,f)-2*z(e,f);
            for j=1:w-1
               for k=1:w-1
                   zbusnew(j,k)=z(j,k)-((z(j,w)*z(w,k))/z(w,w));
               end
           end   
           w=w-1;
         z=zbusnew
        case 5
            display('The impedance matrix is')
            z
            break
          end
end