
/* MHFPropC.cpp, R Miyakawa, 11/2013
 *
 * output = MHFPropC(aperture, inCoordsX, inCoordsY, outCoordX, outCoordY,z_mm,wavelength_nm)
 * 
 * MEX version of HFPropC for speed improvements
 *
 */


#include <stdio.h>
#include <mex.h>
#include <math.h>
#include <curl/curl.h>

#include <iostream>


// Main function to compute propagation:

double * HFPropC(double *apertureR, double *apertureI, 
                 double *inCoordsX, double *inCoordsY,
                 double *inCoordsZ,
                 double *outCoordsX, double *outCoordsY, 
                 double *outCoordsZ,
                 double lambda, long numInPts, long numOutPts){
    
    double * complexField = new double[numOutPts * 2];
    double R, relm, celm;
    double pi = 4*atan(1);
    // counters:
    long k, m;
    
    
    mexPrintf("In pts: %ld\nOut pts: %ld\n", numInPts, numOutPts);
    
    // Fill output with zeros:
    for (k = 0; k < numOutPts * 2; k ++)
        complexField[k] = 0; 
    
    // If pointers are purely real or imaginary they are returned null
    // In this case we need to initialize them:
    
    if (!(apertureR)){
        apertureR = (double*)malloc((sizeof(double))*numInPts);
        for (k = 0; k < numInPts; k++)
            apertureR[k] = 0;
    }
    if (!(apertureI)){
        apertureI = (double*)malloc((sizeof(double))*numInPts);
        for (k = 0; k < numInPts; k++)
            apertureI[k] = 0;
    }
        
    
   
    for (k = 0; k < numInPts; k++){
        
        for (m = 0; m < numOutPts; m++){

            R = sqrt( (outCoordsX[m] - inCoordsX[k]) * (outCoordsX[m] - inCoordsX[k]) +
                      (outCoordsY[m] - inCoordsY[k]) * (outCoordsY[m] - inCoordsY[k]) +
                      (outCoordsZ[m] - inCoordsZ[k]) * (outCoordsZ[m] - inCoordsZ[k])
                    );
            

            complexField[m] 
                    += (apertureR[k] * cos( 2 * pi/lambda * R) -
                            apertureI[k] * sin( 2 * pi/lambda * R))/(R * R);
            
            complexField[m + numOutPts] 
                    += (apertureI[k] * cos( 2 * pi/lambda * R) +
                            apertureR[k] * sin( 2 * pi/lambda * R))/(R * R);

            //mexPrintf("gR: %0.6f, gI: %0.6f\n", complexField[m], complexField[m+ numOutPts]);

        }
    }
    return complexField;
}


// Gateway function for MATLAB interface
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]) 
{
  
    mwSize outRowLen, outColLen, inRowLen, inColLen;
    double *apertureR   = NULL;
    double *apertureI   = NULL;
    double *inCoordsX   = NULL; 
    double *inCoordsY   = NULL; 
    double *inCoordsZ   = NULL; 
    double *outCoordsX  = NULL; 
    double *outCoordsY  = NULL;
    double *outCoordsZ  = NULL;
    
    double *complexField; // first half is real, 2nd half is complex
    
    
    apertureR           = mxGetPr(prhs[0]);
    apertureI           = mxGetPi(prhs[0]);
    inCoordsX           = mxGetPr(prhs[1]);
    inCoordsY           = mxGetPr(prhs[2]);
    inCoordsZ           = mxGetPr(prhs[3]);
    outCoordsX          = mxGetPr(prhs[4]);
    outCoordsY          = mxGetPr(prhs[5]);
    outCoordsZ          = mxGetPr(prhs[6]);
    
    double lam_nm       = (double)(mxGetScalar(prhs[7]));
    
    inRowLen            = mxGetM(prhs[1]);
    inColLen            = mxGetN(prhs[1]);
    outRowLen           = mxGetM(prhs[4]);
    outColLen           = mxGetN(prhs[4]);
    
    double lam_um       = lam_nm/1000;
    
    long numInPts       = ((long)inRowLen) * ((long) inColLen);
    long numOutPts      = ((long)outRowLen) * ((long) outColLen);
    
    
    complexField    = HFPropC(apertureR, apertureI, inCoordsX, inCoordsY, inCoordsZ,
                              outCoordsX, outCoordsY, outCoordsZ, lam_um, numInPts, numOutPts);
                                
                                
    
    plhs[0]         = mxCreateDoubleMatrix(outRowLen, outColLen, mxCOMPLEX);
    double * outR   = mxGetPr(plhs[0]);
    double * outI   = mxGetPi(plhs[0]);

    // Reassign computed array to matlab-allocated array
    for (long k = 0 ; k < numOutPts; k++){
       outR[k] = complexField[k];
       outI[k] = complexField[k + numOutPts];
    }
    
    
}

