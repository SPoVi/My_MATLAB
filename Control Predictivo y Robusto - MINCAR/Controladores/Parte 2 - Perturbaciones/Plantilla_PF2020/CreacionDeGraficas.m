% Autor: Sergio Pons Villanueva
% Fecha : 21/02/2020

%% Datos simulados
figure(100)
subplot(2,1,1)
plot(e_y)
title("Error seguimiento carril")
xlabel("Time")
ylabel("Metros (m)");
grid

subplot(2,1,2)
plot(e_vx)
title("Error seguimiento velocidad máxima")
xlabel("Time")
ylabel("Velocidad (m/s)");
grid

figure(101)
subplot(2,1,1)
plot(vx)
title("Velocidad vx")
xlabel("Time")
ylabel("Velocidad (m/s)");
grid


%% Guardar resultados y poder compararlos posteriormente
vx1 = vx;
evx1 = e_vx;
ey1 = e_y;

save p1 vx1 evx1 ey1

% guardado con pert: q = 0.01 rvx = 1 ry = 10 h=hu= 20 con filtro, pert
% 1000
%% Para comparar 
load p1

% legend("Con rvx = 5", "Con rvx = 1");
% legend("Sin perturbacion", "Con perturbacion");
% legend("Con filtro", "Sin filtro");
% legend("Pert 500", "Pert 1000");
figure(100)
subplot(2,1,1)
hold on
plot(e_y)
plot(ey1)
title("Error seguimiento carril")
legend("Pert 2000", "Pert 1000");
xlabel("Time")
ylabel("Metros (m)");
hold off
grid

subplot(2,1,2)
hold on
plot(e_vx)
plot(evx1)
title("Error seguimiento velocidad máxima")
legend("Pert 2000", "Pert 1000");
xlabel("Time")
ylabel("Velocidad (m/s)");
hold off
grid

figure(101)
subplot(2,1,1)
hold on
plot(vx)
plot(vx1)
title("Velocidad vx")
legend("Pert 2000", "Pert 1000");
xlabel("Time")
ylabel("Velocidad (m/s)");
hold off
grid
