function [U,DU]=ControlLaw_MPC_SS(parameters,w,data);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esta funci?n se ejecuta cada ciclo de control e implementa la ley de
% control del MPC
%
% Entrada:
%   -parameters: Estructura seg?n lo definido en la funci?n
%   [parameters, Ref,Td]=Initialization_MPC_SS;
%   -w: vector de referencia futura
%   -data: estructura compuesta por dos campos
%       data.previousiter : almacena los datos de la iteraci?n anterior
%           -data.previousiter.U : Valor de la acci?n anterior de control
%           -data.previousiter.X: Valor del estado anterior
%           -data.previousiter.V: Valor anterior de la perturbaci?n
%           conocida y medible (si existe)
%           -data.previousiter.Vm: Valor anterior de la perturbaci?n
%           medible (si existe)
%           -data.previousiter.k: Valor de la iteraci?n anterior (n?mero de
%           iteraci?n)
%       data.currentiter : almacena los datos de la iteraci?n actual
%           -data.currentiter.U : Valor actual de la acci?n de control
%           -data.currentiter.X: Valor actual del estado
%           -data.currentiter.V: Valor actual de la perturbaci?n medible y
%           conocida (si existe)
%           -data.currentiter.Vm: Valor actual de la perturbaci?n medible (si existe)
%           -data.currentiter.k: Valor de la iteraci?n actual (n?mero de
%           iteraci?n)
%           -data.currentiter.Vplus: Valor de la secuencia estimada de la
%           perturbaci?n conocida para el horizonte correspondiente al
%           instante actual (almacena desde t a t+h-1) (si existe)
%           -data.currentiter.Y: Valor actual de la salida del sistema
%
%   NOTA: Los valores de esta estructura se actualizan autom?ticamente,
%
% Salida:
%   -U: Acci?n de control en el instante actual
%   -DU:Variaci?n de control en el instante actual
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = parameters.F*data.currentiter.X + parameters.Gp*data.previousiter.U + parameters.Fpm*data.currentiter.Vm;
DU = parameters.Knu*(w-f); % K(1:nu,:) las dos primeras filas
U = DU + data.previousiter.U;