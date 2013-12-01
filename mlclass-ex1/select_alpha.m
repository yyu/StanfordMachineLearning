%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];


%% ================ Gradient Descent ================

%% ===== alpha =====

fprintf('Running gradient descent ...\n');

alphas = [0.01 0.03 0.1];
colors = ['b' 'r' 'k'];
widths = [1 3 5];

figure;
for i=1:3,
    data = load('ex1data2.txt');
    X = data(:, 1:2);
    y = data(:, 3);
    m = length(y);

    [X mu sigma] = featureNormalize(X);

    X = [ones(m, 1) X];
    theta = zeros(3, 1);

    alpha = alphas(i);
    num_iters = 400;

    fprintf('alpha:\n');
    fprintf(' %f \n', alpha);
    fprintf('\n');
    fprintf('num_iters:\n');
    fprintf(' %f \n', num_iters);
    fprintf('\n');

    [theta, J_history] = gradientDescentMulti(X, y, theta, alpha,  num_iters);

    plot(1:numel(J_history), J_history, colors(i), 'LineWidth', widths(i));
    if i == 1,
        xlabel('Number of iterations');
        ylabel('Cost J');
        hold on;
    end;
end;


