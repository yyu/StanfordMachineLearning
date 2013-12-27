function plotDataPoints(X, idx, K)
%PLOTDATAPOINTS plots data points in X, coloring them so that those with the same
%index assignments in idx have the same color
%   PLOTDATAPOINTS(X, idx, K) plots data points in X, coloring them so that those 
%   with the same index assignments in idx have the same color

% Create palette
palette = hsv(K + 1);
colors = palette(idx, :);

% Plot the data
%printf('palette: ------------------------------------\n');
%disp(palette);
%printf('colors: ------------------------------------\n');
%disp(colors);
%printf('X: ------------------------------------\n');
%disp(X([1,10],:));
%scatter(X(1:100,1), X(1:100,2), 15, colors);
scatter(X(:,1), X(:,2), 15, colors);

end
