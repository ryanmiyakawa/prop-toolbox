function out = propCompare(in, lambda, d1, d2, dz, type)
N = size(in,1);
lambda_nm = lambda*1e9;
D1 = d1*N;
D2 = d2*N;

D1_um = D1*1e6;
D2_um = D2*1e6;

dz_mm = dz*1e3;

tic
switch type
    case 'fsprop'
        
        out = prop10(in, D1_um, N, D2_um, dz_mm, lambda_nm, 0, 0);
        
    case '2step'
        
        [x2, y2, out] = fresnelProp2Step(in, lambda, d1, d2, dz);
        
    case 'angSpec'
        
        [x2, y2, out] = fresnelProp2Step(in, lambda, d1, d2, dz);
       
    case 'full'
        
        out = prop10d(in, D1_um, N, D2_um, dz_mm, lambda_nm, 0, 0);
        
end
toc