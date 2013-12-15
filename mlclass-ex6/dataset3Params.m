function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% the following code will set C=1 and sigma=0.1

choices = [0.01 0.03 0.1 0.3 1 3 10 30];
smallest_error = 99999999;

for _C = choices,
    for _sigma = choices,
        model = svmTrain(X, y, _C, @(x1, x2) gaussianKernel(x1, x2, _sigma));
        predictions = svmPredict(model, Xval);
        pred_err = mean(double(predictions ~= yval));
        fprintf('_C, _sigma: %f, %f (%f, %f), pred_err: %f.\n', _C, _sigma, C, sigma, pred_err);
        if pred_err < smallest_error,
            smallest_error = pred_err;
            C = _C;
            sigma = _sigma;
            fprintf('C, sigma: %f, %f.\n', C, sigma);
        end
    end
end
fprintf('C: %f, sigma: %f, smallest error: %f.\n', C, sigma, smallest_error);

% =========================================================================

end
