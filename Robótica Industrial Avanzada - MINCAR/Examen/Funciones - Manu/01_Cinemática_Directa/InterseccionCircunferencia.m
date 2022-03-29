
function [OK,ErrorMsg,xp1,xp2]=InterseccionCircunferencia(r0,x0,y0,r1,x1,y1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Función que devuelve la intersección entre dos circunferencias en el
%plano.
%
%Asier Zubizarreta
%19-03-2007
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tol=1e-6;

OK=0;
ErrorMsg=[];
xp1=[];
xp2=[];

if(abs(x0-x1)<tol)
    %Aplico el th del coseno:
    if(y1>y0)        
        if(abs((r1^2-r0^2-(y1-y0)^2)/(-2*r0*(y1-y0)))>1)
            OK=0;
            ErrorMsg='No existe intersección';
            return            
        else
            alpha=acos((r1^2-r0^2-(y1-y0)^2)/(-2*r0*(y1-y0)));
            xp1=[x0+r0*cos(alpha+pi/2) y0+r0*sin(alpha+pi/2)];
            xp2=[x0+r0*cos(pi/2-alpha) y0+r0*sin(pi/2-alpha)];    
        end;
    else
        if(abs((r0^2-r1^2-(y0-y1)^2)/(-2*r1*(y0-y1)))>1)
            OK=0;
            ErrorMsg='No existe intersección';
            return
        else
            alpha=acos((r0^2-r1^2-(y0-y1)^2)/(-2*r1*(y0-y1)));
            xp1=[x1+r1*cos(alpha+pi/2) y1+r1*sin(alpha+pi/2)];
            xp2=[x1+r1*cos(pi/2-alpha) y1+r1*sin(pi/2-alpha)];     
        end
    end
else
    %Punto P mediante intersección de circunferencias:

    D=-2*x0; E=-2*y0; F=x0^2+y0^2-r0^2;
    G=-2*x1; H=-2*y1; I=x1^2+y1^2-r1^2;

    M=(H-E)/(D-G); N=(I-F)/(D-G);
    A=M^2+1; B=2*M*N+D*M+E; C=N^2+D*N+F;

    %Sistema
    %Ay^2+By+C=0
    %x=My+N;

    if((B^2-4*A*C)<0 | isnan(M))
        OK=0;
        ErrorMsg='No existe intersección';
        return
    end

    y1=(-B+(sqrt(B^2-4*A*C)))/(2*A);
    y2=(-B-(sqrt(B^2-4*A*C)))/(2*A);


    x1=M*y1+N;
    x2=M*y2+N;

    xp1=[x1 y1];
    xp2=[x2 y2];
end

OK=1;


