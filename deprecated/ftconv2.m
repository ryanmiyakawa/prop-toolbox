function C = ftconv2(A, B, delta) % function C = myconv2(A, B, delta)
    N = size(A, 1);
    C = ift2(ft2(A, delta) .* ft2(B, delta), 1/(N*delta));