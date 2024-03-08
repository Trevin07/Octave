% Define the parameters
P0 = 3.9; % initial population in millions, at t=0 (year 1790)
b = 0.000764; % intrinsic growth rate
K = 390; % carrying capacity in millions

% Time vector from t=0 (1790) to t=35 (2010) in increments of 1 (each t represents a decade)
t = 0:1:35; % Adjusted for continuity through each decade till 2035

% Initialize population vector
P = zeros(1, length(t));
P(1) = P0; % initial population

% Calculate population at each time step using the discrete logistic model
for i = 2:length(t)
    P(i) = P(i-1) + b * (K - P(i-1)) * P(i-1);
end

% Predict population for 2035 (t = 35) and 2080 (t = 55)
% For 2080, we need to extend our model calculation
t_extended = 36:45; % From 2035 to 2080 in 10-year increments
P_extended = zeros(1, length(t_extended) + length(P));
P_extended(1:length(P)) = P;

for i = (length(P)+1):(length(P)+length(t_extended))
    P_extended(i) = P_extended(i-1) + b * (K - P_extended(i-1)) * P_extended(i-1);
end

% Estimated populations in 2035 and 2080
population_2035 = P_extended(length(P)); % or directly P(end)
population_2080 = P_extended(end);

% Plotting
figure;
plot(1790:10:2010, P, 'b-o', 'LineWidth', 2); % Observed data plot
hold on;
plot([2010, 2020:10:2080], P_extended(length(P):end), 'r-*', 'LineWidth', 2); % Predicted data plot
xlabel('Year');
ylabel('Population (in million)');
title('US Population: Observed and Predicted');
legend('Observed (till 2010)', 'Predicted (2010 onwards)', 'Location', 'best');
grid on;

% Display estimated populations for 2035 and 2080
disp(['Estimated population in 2035: ', num2str(population_2035), ' million']);
disp(['Estimated population in 2080: ', num2str(population_2080), ' million']);

