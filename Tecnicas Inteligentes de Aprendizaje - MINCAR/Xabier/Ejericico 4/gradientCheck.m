%% Gradient check

for i = 1:n
    thetaPlus = theta;
    thetaPlus(i) = ThetaPlus(i) + EPSILON;
    thetaMinus = theta;
    thetaMinus(i) = thetaMinus(i) - EPSILON;
    
    gradApprox(i) = (J(thetaPlus(i)) - J(thetaMinus(i)) / (2 * EPSILON);
end