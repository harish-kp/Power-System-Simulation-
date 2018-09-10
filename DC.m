clear all
 clc
 config=input('Enter 1 for vertical, 2 for horizontal \n');
 if config==1
     D11=input('Enter horizontal dist b/w top conductors in m');
     D1=D11;
     D22=input('Enter horizontal dist b/w middle conductors in m');
     D2=D22;
     D33=input('Enter horizontal dist b/w bottom conductors in m');
     D3=D33;
     H11=input('Enter height b/w top and middle conductors in m');
     H1=H11;
     H22=input('Enter height b/w Bottom and middle conductors in m');
     H2=H22;
     Z1=(D22-D1)/2;
     Dab=sqrt(H1^2+Z1^2);
     Db1c1=Dab;
     Z2=(D2-D3)/2;
     Dbc=sqrt(H2^2+Z2^2);
     Da1b1=Dbc;
     Dc1b=sqrt(H1^2+(D2-Z1)^2);
     Dab1=Dc1b;
     Db1c=sqrt(H1^2+(D2-Z2)^2);
     Da1b=Db1c;
     Dca=H1+H2;
     Dc1a1=Dca;
     Dca1=D3;
     Dc1a=D1;
     DAB=(Dab*Da1b*Dab1*Da1b1)^(0.25);
     DBC=(Dbc*Db1c1*Db1c*Dc1b)^(0.25);
     DCA=(Dca*Dc1a1*Dc1a*Dca1)^(0.25);
     disp('GMD')
     GMD=(DAB*DBC*DCA)^(1/3);
     Daa1=sqrt(Dca^2+D3^2);
     Dbb1=D2;
     Dcc1=sqrt(Dca^2+D3^2);
 else
     D11=input('Enter the horizontal dist b/w 2 phases of 1st ckt in m[Dab,Dbc]');
     D1=D11;
     D11=input('Enter the horizontal dist b/w 2 phases of 2nd ckt in m[Dab,Dbc]');
     D2=D22;
     D12=input('Enter the horizontal dist b/w 2 phases of 1st ckt in m');
     D3=D12;
     Dab=D1(1);
     Dbc=D1(2);
     Da1b1=D2(1);
     Db1c1=D2(2);
     Dab1=Dab+Dbc+D3+Db1c1;
     Da1b=Da1b1+Db1c1+D3+Dbc;
     Db1c=Db1c1+D3;
     Dc1b=Dbc+D3;
     Dca=D1(1)+D1(2);
     Dc1a1=D2(1)+D2(2);
     Dc1a=Dca+D3;
     Da1c=Dc1a1+D3;
     DAB=(Dab*Da1b1*Da1b*Dab1)^(0.25);
     DBC=(Dbc*Db1c1*Db1c*Dbc1)^(0.25);
     DCA=(Dca*Dc1a*Dca1*Dc1a1)^(0.25);
     disp('GMD in m')
     GMD=(DAB*DBC*DCA)^(1/3);
     Daa1=D1(1)+D1(2)+D2(1)+D2(2)+D3;
     Dbb1=D1(2)+D2(2)+D3;
     Dcc1=D3;
 end
 D=input('Entewr the dia of conductor in m');
 r=D/2;
 GMR=0.0788*r
 NC=input('Enter the no. of cond in phase');
 if NC==1
     DSAL=sqrt(GMR*Daa1);
     DSBL=sqrt(GMR*Dbb1);
     DSCL=sqrt(GMR*Dcc1);
     GMRL=(DSAL*DSBL*DSCL)^(1/3);
     DSAC=sqrt(r*Daa1);
     DSBC=sqrt(r*Dbb1);
     DSCC=sqrt(r*Dcc1);
     GMRC=(DSAC*DSBC*DSCC)^(1/3);
     
 elseif NC==2
     BS=input('Enter the bundle spacing in m');
     DS1=sqrt(GMR*BS);
     DSAL=sqrt(DS1*Daa1);
     DSBL=sqrt(DS1*Dbb1);
     DSCL=sqrt(DS1*Dcc1);
     GMRL=(DSAL*DSBL*DSCL)^(1/3);
     DS2=sqrt(r*BS);
     DSAC=sqrt(DS2*Daa1);
     DSBC=sqrt(DS2*Dbb1);
     DSCC=sqrt(DS2*Dcc1);
     GMRC=(DSAC*DSBC*DSCC)^(1/3);
 elseif NC==3
     BS=input('Enter bundle spacing in m');
     BS1=(BS^2*GMR)^(1/3);
     DSAL=sqrt(BS1*Daa1);
     DSBL=sqrt(BS1*Dbb1);
     DSCL=sqrt(BS1*Dcc1);
     GMRL=(DSAL*DSBL*DSCL)^(1/3);
     DS2=(BS^2*r)^(1/3);
     DSAC=sqrt(DS2*Daa1);
     DSBC=sqrt(DS2*Dbb1);
     DSCC=sqrt(DS2*Dcc1);
     GMRC=(DSAC*DSBC*DSCC)^(1/3);
 end
 L=0.2*log(GMD/GMRL)
 C=0.0566/log(GMD/GMRL)
 