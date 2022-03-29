function [U,DU,ek,Duopt,Reference,parameters]=ControlLaw_MPC_SS(parameters,trackdata,data);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esta funci�n se ejecuta cada ciclo de control e implementa la ley de
% control del MPC
%
% Entrada:
%   -parameters: Estructura seg?n lo definido en la funci?n
%   [parameters, Ref,Td]=Initialization_SS_MIMO_DU;
%   -trackdata: Estrcutura con la referencia (No cambiar!)
%   -data: estructura compuesta por dos campos
%       data.previousiter : almacena los datos de la iteraci?n anterior
%           -data.previousiter.U : Valor de la acci?n anterior de control
%           -data.previousiter.X: Valor del estado anterior
%           -data.previousiter.Pcg: valor del CG del estado anterior
%           -data.previousiter.k: Valor de la iteraci?n anterior (n?mero de
%           iteraci?n)
%           -data.previousiter.startidx (No cambiar!)
%       data.currentiter : almacena los datos de la iteraci?n actual
%           -data.currentiter.U : Valor actual de la acci?n de control
%           -data.currentiter.X: Valor actual del estado
%           -data.currentiter.Pcg: valor del CG del estado anterior
%           -data.currentiter.k: Valor de la iteraci?n actual (n?mero de
%           iteraci?n)
%          -data.currentiter.startidx (No cambiar!)
%
%   NOTA: Los valores de esta estructura se actualizan autom?ticamente,
%
% Salida:
%   -U: Acci�n de control en el instante actual
%   -DU:Variaci�n de control en el instante actual
%   -ek: Error instant�neo asociado al instante t, de igual dimensi�n que
%   las salidas consideradas.
%   -Duopt: Secuencia de control �ptima completa (Se usa para plotear)
%   -Reference: Estructura Reference que da la funci�n CreateReference. (Se
%   usa para plotear)
%   -Parameters: Se requiere para la animaci�n. En modelos lineales
%   constantes tiene el valor de la entrada. En modelos lineles LTV es
%   necesario actualizar sus campos en esta funci�n.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   

%Recuerda que para generar la referencia en el SR local has de usar esta
%funci�n. La documentaci�n est� en el cuaderno de pr�cticas
% [Reference, data]=CreateReference(trackdata,data, parameters) ; 

%Recuerda que para plotear es fundamental para plotear que en la estructura
%parameters est�n almacenadas correctamente.
% parameters.A
% parameters.B
% parameters.C
% parameters.h
% parameters.hu
% parameters.Gp
% parameters.F
% parameters.G
%En el caso de controladores LTV, que var�an de un instante a otro, se
%recomienda actualizarlos en esta funci�n (en vez de hacerlo en
%Initialization).

%Para el c�lculo del error instant�neo, que permite ver si el controlador
%funciona adecuadamente, se recomienda usar la forma
%
%ek= w(1:2)-C*X
%
%donde w(1:2) es la referencia de y (lateral) y vx( longitudinal), C es la
%matriz de SS lineal y X el valor del estado en el instante actual (cogido
%de data.currentiter).


