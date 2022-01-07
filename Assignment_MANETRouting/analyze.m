DSR30 = readtable("C:\Users\Mahnoor\Downloads\ACN3\MANET_PURE\DSR30.csv");
DSR20 = readtable("C:\Users\Mahnoor\Downloads\ACN3\MANET_PURE\DSR20.csv");
DSR10 = readtable("C:\Users\Mahnoor\Downloads\ACN3\MANET_PURE\DSR10.csv");

DSDV30 = readtable("C:\Users\Mahnoor\Downloads\ACN3\MANET_PURE\DSDV30.csv");
DSDV20 = readtable("C:\Users\Mahnoor\Downloads\ACN3\MANET_PURE\DSDV20.csv");
DSDV10 = readtable("C:\Users\Mahnoor\Downloads\ACN3\MANET_PURE\DSDV10.csv");

AODV30 = readtable("C:\Users\Mahnoor\Downloads\ACN3\MANET_PURE\AODV30.csv");
AODV20 = readtable("C:\Users\Mahnoor\Downloads\ACN3\MANET_PURE\AODV20.csv");
AODV10 = readtable("C:\Users\Mahnoor\Downloads\ACN3\MANET_PURE\AODV10.csv");

figure(), subplot(1,2,1), hold on, grid on, box on
plot(AODV10.SimulationSecond, cumsum(AODV10.PacketsReceived), 'r', 'linew', 2);
plot(DSDV10.SimulationSecond, cumsum(DSDV10.PacketsReceived), 'b.-', 'linew', 2);
plot(DSR10.SimulationSecond, cumsum(DSR10.PacketsReceived), 'g:', 'linew', 2);
legend("AODV 10", "DSDV 10", "DSR 10");
title("MANET Routing protocols with 10 WiFi nodes");
xlabel("Simulation Second"); ylabel("Packets Received")
subplot(1,2,2), grid on, hold on, box on
plot(AODV10.SimulationSecond, (AODV10.ReceiveRate), 'r', 'linew', 2);
plot(DSDV10.SimulationSecond, (DSDV10.ReceiveRate), 'b.-', 'linew', 2);
plot(DSR10.SimulationSecond, (DSR10.ReceiveRate), 'g:', 'linew', 2);
legend("AODV 10", "DSDV 10", "DSR 10");
title("MANET Routing protocols with 10 WiFi nodes");
xlabel("Simulation Second"); ylabel("Receive Rate")




figure(), subplot(1,2,1), hold on, grid on, box on
plot(AODV10.SimulationSecond, cumsum(AODV10.PacketsReceived), 'r', 'linew', 2);
plot(DSDV10.SimulationSecond, cumsum(DSDV10.PacketsReceived), 'b.-', 'linew', 2);
plot(DSR10.SimulationSecond, cumsum(DSR10.PacketsReceived), 'g:', 'linew', 2);
legend("AODV 10", "DSDV 10", "DSR 10");
title("MANET Routing protocols with 10 WiFi nodes");
xlabel("Simulation Second"); ylabel("Packets Received")
subplot(1,2,2), grid on, hold on, box on
plot(AODV10.SimulationSecond, (AODV10.ReceiveRate), 'r', 'linew', 2);
plot(DSDV10.SimulationSecond, (DSDV10.ReceiveRate), 'b.-', 'linew', 2);
plot(DSR10.SimulationSecond, (DSR10.ReceiveRate), 'g:', 'linew', 2);
legend("AODV 10", "DSDV 10", "DSR 10");
title("MANET Routing protocols with 10 WiFi nodes");
xlabel("Simulation Second"); ylabel("Receive Rate")



figure(), subplot(1,2,1), hold on, grid on, box on
plot(AODV20.SimulationSecond, cumsum(AODV20.PacketsReceived), 'r', 'linew', 2);
plot(DSDV20.SimulationSecond, cumsum(DSDV20.PacketsReceived), 'b.-', 'linew', 2);
plot(DSR20.SimulationSecond, cumsum(DSR20.PacketsReceived), 'g:', 'linew', 2);
legend("AODV 20", "DSDV 20", "DSR 20");
title("MANET Routing protocols with 20 WiFi nodes");
xlabel("Simulation Second"); ylabel("Packets Received")
subplot(1,2,2), grid on, hold on, box on
plot(AODV20.SimulationSecond, (AODV20.ReceiveRate), 'r', 'linew', 2);
plot(DSDV20.SimulationSecond, (DSDV20.ReceiveRate), 'b.-', 'linew', 2);
plot(DSR20.SimulationSecond, (DSR20.ReceiveRate), 'g:', 'linew', 2);
legend("AODV 20", "DSDV 20", "DSR 20");
title("MANET Routing protocols with 20 WiFi nodes");
xlabel("Simulation Second"); ylabel("Receive Rate");


figure(), subplot(1,2,1), hold on, grid on, box on
plot(AODV30.SimulationSecond, cumsum(AODV30.PacketsReceived), 'r', 'linew', 2);
plot(DSDV30.SimulationSecond, cumsum(DSDV30.PacketsReceived), 'b.-', 'linew', 2);
plot(DSR30.SimulationSecond, cumsum(DSR30.PacketsReceived), 'g:', 'linew', 2);
legend("AODV 30", "DSDV 30", "DSR 30");
title("MANET Routing protocols with 30 WiFi nodes");
xlabel("Simulation Second"); ylabel("Packets Received")
subplot(1,2,2), grid on, hold on, box on
plot(AODV30.SimulationSecond, (AODV30.ReceiveRate), 'r', 'linew', 2);
plot(DSDV30.SimulationSecond, (DSDV30.ReceiveRate), 'b.-', 'linew', 2);
plot(DSR30.SimulationSecond, (DSR30.ReceiveRate), 'g:', 'linew', 2);
legend("AODV 30", "DSDV 30", "DSR 30");
title("MANET Routing protocols with 30 WiFi nodes");
xlabel("Simulation Second"); ylabel("Receive Rate");
