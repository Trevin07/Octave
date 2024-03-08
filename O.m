a = 1.2;
b = 0.6;
c = 0.8;
d = 0.3;

t0 = 0;
state0 = [2; 1];  % Note the use of semicolon to create a column vector

tN = 30;

ode_system = @(time, state) [a*state(1) - b*state(1)*state(2);
                             -c*state(2) + d*state(1)*state(2)];

[X, Y] = ode45(ode_system, [t0, tN], state0);

% Plotting
figure;
plot(X, Y(:,1), 'b', X, Y(:,2), 'r');
xlabel('Time');
ylabel('Population');
title('Predator-Prey Model');
legend('Prey (X)', 'Predator (Y)');

