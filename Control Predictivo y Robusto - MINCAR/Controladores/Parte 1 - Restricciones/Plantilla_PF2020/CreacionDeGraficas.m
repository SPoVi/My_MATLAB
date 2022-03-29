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