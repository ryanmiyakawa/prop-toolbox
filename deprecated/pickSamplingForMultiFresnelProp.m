function pickSamplingForMultiFresnelProp(lambda, dz, delta_1, D1, Dn, R)

delta_N = (lambda*dz - Dn*delta_1)/D1;

fprintf('Condition 1: Delta_N < %0.2f\n', delta_N);

N = D1/(2*delta_1) + Dn/(2*delta_N) + lambda*dz/(2*delta_1*delta_N);

fprintf('Condition 2: N > %0.2f\n', N);

dnl = (1 + dz/R)*delta_1 - lambda*dz/D1;
dnr = (1 + dz/R)*delta_1 + lambda*dz/D1;

fprintf('Condition 3: %0.2f < Delta_N < %0.2f\n', dnl, dnr);
