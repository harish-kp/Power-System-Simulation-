
display('1.Single line to Ground Fault');
display('2.Line to line fault');
display('3.Double line to ground fault');
display('4.Exit');
ch=input('Enter your choice');
MVA=input('Enter the value of base MVA');
KV= input('Enter the value of base KV');
vl=input('Enter the line voltage');
vph=vl/sqrt(3);
Ibb=MVA/(sqrt(3)*KV);
E=1+0i;
display('Let E be 1 p.u');
a=-0.5+0.866i;
a1=-0.5-0.866i;
switch(ch)
    case 1
        z1=input('Enter the positive sequence impedance in p.u');
        z2=input('Enter the negative sequence impedance in p.u');
        z0=input('Enter the zero sequence impedance in p.u');
        zf=input('Enter fault impedance');
        Ib=0;
        Ic=0;
        Ia1=E/(z1+z2+z0)+(3*zf)
        Ia2=Ia1
        Ia0=Ia1
        va1=E-(z1*Ia1)
        va2=-(z2*Ia2)
        va0=-(z0*Ia0)
        If=3*abs(Ia1)
        puIf=If*Ibb
        va=va0+va1+va2
        vb=va0+(a1*va1)+(a*va2)
        vc=va0+(a*va1)+(a1*va2)
        vab=va-vb
        vbc=vb-vc
        vca=vc-va
        puvab=abs(vab*vph)
        puvbc=abs(vbc*vph)
        puvca=abs(vca*vph)
    case 2
        z1=input('Enter the positive sequence impedance in p.u');
        z2=input('Enter the negative sequence impedance in p.u');
        z0=input('Enter the zero sequence impedance in p.u');
        zf=input('Enter fault impedance');
        Ia0=0;
        Ia1=E/(z1+z2+zf)
        Ia2=-Ia1
        Ia=Ia0+Ia1+Ia2
        Ib=Ia0+(Ia1*a1)+(a*Ia2)
        Ic=-Ib
        If=(-sqrt(3)*Ia1)
        va0=0;
        va1=E-(z1*Ia1)
        va2=va1
        va=va0+va1+va2
        vb=va0+(a1*va1)+(a*va2)
        vc=vb
        vab=va-vb
        vbc=vb-vc
        vca=vc-va
        puvab=(vab*vph)
        puvbc=(vbc*vph)
        puvca=(vca*vph) 
        puIf=Ibb*If
        puIa=Ibb*Ia
        puIb=Ibb*Ib
        puIc=-puIb
        pause
    case 3
        z1=input('Enter the positive sequence impedance in p.u');
        z2=input('Enter the negative sequence impedance in p.u');
        z0=input('Enter the zero sequence impedance in p.u');
        zf=input('Enter fault impedance');
        vb=0;
        vc=0;
        Ia1=E/(z1+((z2*z0)/(z2+z0)))
        va1=E-(Ia1*z1)
        va0=va1
        va2=va0
        va1=va2
        Ia2=-va2/z2
        Ia0=-va0/z0
        Ia=Ia0+Ia1+Ia2
        Ib=Ia0+(Ia1*a1)+(a*Ia2)
        Ic=Ia0+(Ia1*a)+(a1*Ia2)
        If=Ib+Ic
        va=va0+va1+va2
        vab=va-vb
        vbc=vb-vc
        vca=vc-va
        puIb=abs(Ibb)*Ib
        puIf=abs(Ibb)*Ic
        puvab=vab*vph
        puvca=vca*vph
        pause
    case 4 
        exit;
end