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

% guardado sin pert: Filtro PA en 8  - Urad = 10
% qdelta = 0.1 qtau = 0.01 rvx = 0.001 ry = 10 h=hu= 20 Ylimitinf vxy = 3 
%% Para comparar 
load p1

% legend("Con rvx = 5", "Con rvx = 1");
% legend("Sin perturbacion", "Con perturbacion");
% legend("Con filtro", "Sin filtro");
% legend("Pert 500", "Pert 1000");
% legend("qdelta = 0.1", "qdelta = 0.01");
% legend("filtro PB", "sin filtro");
% legend("urad = 10", "urad= 15");
% legend("durad = 2", "durad= 5");

figure(100)
subplot(2,1,1)
hold on
plot(e_y)
plot(ey1)
title("Error seguimiento carril")
legend("durad = 10", "durad= 5")
xlabel("Time")
ylabel("Metros (m)");
hold off
grid

subplot(2,1,2)
hold on
plot(e_vx)
plot(evx1)
title("Error seguimiento velocidad máxima")
legend("durad = 10", "durad= 5")
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
legend("durad = 10", "durad= 5")
xlabel("Time")
ylabel("Velocidad (m/s)");
hold off
grid

%%  Guardar prueba - Filtro PB

vx2 = vx;
evx2 = e_vx;
ey2 = e_y;

save p2 vx2 evx2 ey2

% guardado sin pert: filtro PB
% qdelta = 0.1 qtau = 0.01 rvx = 0.001 ry = 10 h=hu= 20 Ylimitinf vxy = 3

%% Guardar prueba - Filtro PA

vx3 = vx;
evx3 = e_vx;
ey3 = e_y;

save p3 vx3 evx3 ey3

% guardado sin pert: filtro PA
% qdelta = 0.1 qtau = 0.01 rvx = 0.001 ry = 10 h=hu= 20 Ylimitinf vxy = 3
%% Para comparar filtros 
load p1
load p2
load p3

% legend("Con rvx = 5", "Con rvx = 1");
% legend("Sin perturbacion", "Con perturbacion");
% legend("Con filtro", "Sin filtro");
% legend("Pert 500", "Pert 1000");
% legend("qdelta = 0.1", "qdelta = 0.01");
% legend("filtro PB", "sin filtro");

figure(300)
subplot(2,1,1)
hold on
plot(e_y)
plot(ey2)
plot(ey1)
title("Error seguimiento carril")
legend("filtro PA", "filtro PB","sin filtro");
xlabel("Time")
ylabel("Metros (m)");
hold off
grid

subplot(2,1,2)
hold on
plot(e_vx)
plot(evx2)
plot(evx1)
title("Error seguimiento velocidad máxima")
legend("filtro PA", "filtro PB","sin filtro");
xlabel("Time")
ylabel("Velocidad (m/s)");
hold off
grid

figure(301)
subplot(2,1,1)
hold on
plot(vx)
plot(vx2)
plot(vx1)
title("Velocidad vx")
legend("filtro PA", "filtro PB","sin filtro");
xlabel("Time")
ylabel("Velocidad (m/s)");
hold off
grid
