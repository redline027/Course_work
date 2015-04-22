% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 503.418964039935990 ; 526.545914924848030 ];

%-- Principal point:
cc = [ 141.293221130994480 ; 122.710971037659920 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.489301280308638 ; 1.069685989923974 ; -0.021391158364757 ; 0.007539167935041 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 9.154011393617253 ; 9.798341215318864 ];

%-- Principal point uncertainty:
cc_error = [ 10.855094391472957 ; 10.493338273594754 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.082826252612274 ; 0.853492394928701 ; 0.004106998290822 ; 0.003264525492288 ; 0.000000000000000 ];

%-- Image size:
nx = 320;
ny = 240;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 26;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -2.157116e+00 ; -2.213475e+00 ; 1.581385e-02 ];
Tc_1  = [ -3.796245e+01 ; -9.855262e+01 ; 7.233878e+02 ];
omc_error_1 = [ 1.986636e-02 ; 2.166070e-02 ; 5.110503e-02 ];
Tc_error_1  = [ 1.570508e+01 ; 1.442392e+01 ; 1.384469e+01 ];

%-- Image #2:
omc_2 = [ NaN ; NaN ; NaN ];
Tc_2  = [ NaN ; NaN ; NaN ];
omc_error_2 = [ NaN ; NaN ; NaN ];
Tc_error_2  = [ NaN ; NaN ; NaN ];

%-- Image #3:
omc_3 = [ NaN ; NaN ; NaN ];
Tc_3  = [ NaN ; NaN ; NaN ];
omc_error_3 = [ NaN ; NaN ; NaN ];
Tc_error_3  = [ NaN ; NaN ; NaN ];

%-- Image #4:
omc_4 = [ 2.129204e+00 ; 2.253668e+00 ; -4.870478e-03 ];
Tc_4  = [ -1.441869e+02 ; -1.128693e+02 ; 8.094431e+02 ];
omc_error_4 = [ 2.264243e-02 ; 2.720718e-02 ; 5.404466e-02 ];
Tc_error_4  = [ 1.756974e+01 ; 1.622751e+01 ; 1.680802e+01 ];

%-- Image #5:
omc_5 = [ -1.635283e+00 ; -1.978881e+00 ; 6.731702e-01 ];
Tc_5  = [ -8.151965e+01 ; -1.321827e+02 ; 9.108536e+02 ];
omc_error_5 = [ 1.796608e-02 ; 1.672193e-02 ; 2.984888e-02 ];
Tc_error_5  = [ 1.969609e+01 ; 1.820836e+01 ; 1.626620e+01 ];

%-- Image #6:
omc_6 = [ NaN ; NaN ; NaN ];
Tc_6  = [ NaN ; NaN ; NaN ];
omc_error_6 = [ NaN ; NaN ; NaN ];
Tc_error_6  = [ NaN ; NaN ; NaN ];

%-- Image #7:
omc_7 = [ NaN ; NaN ; NaN ];
Tc_7  = [ NaN ; NaN ; NaN ];
omc_error_7 = [ NaN ; NaN ; NaN ];
Tc_error_7  = [ NaN ; NaN ; NaN ];

%-- Image #8:
omc_8 = [ 1.857211e+00 ; 1.964824e+00 ; -5.036103e-01 ];
Tc_8  = [ -9.072336e+01 ; -5.879005e+01 ; 5.525942e+02 ];
omc_error_8 = [ 1.160554e-02 ; 1.546830e-02 ; 2.815270e-02 ];
Tc_error_8  = [ 1.193302e+01 ; 1.100179e+01 ; 1.040101e+01 ];

%-- Image #9:
omc_9 = [ NaN ; NaN ; NaN ];
Tc_9  = [ NaN ; NaN ; NaN ];
omc_error_9 = [ NaN ; NaN ; NaN ];
Tc_error_9  = [ NaN ; NaN ; NaN ];

%-- Image #10:
omc_10 = [ -1.454146e+00 ; -1.948045e+00 ; -7.764285e-02 ];
Tc_10  = [ -2.089786e+01 ; -1.046913e+02 ; 6.008446e+02 ];
omc_error_10 = [ 1.280453e-02 ; 1.968386e-02 ; 2.779893e-02 ];
Tc_error_10  = [ 1.296284e+01 ; 1.193995e+01 ; 1.152570e+01 ];

%-- Image #11:
omc_11 = [ 2.152422e+00 ; 1.597593e+00 ; 1.478650e-01 ];
Tc_11  = [ -1.386452e+02 ; -5.016236e+01 ; 6.338541e+02 ];
omc_error_11 = [ 1.486299e-02 ; 1.183768e-02 ; 2.998756e-02 ];
Tc_error_11  = [ 1.387643e+01 ; 1.273504e+01 ; 1.325740e+01 ];

%-- Image #12:
omc_12 = [ NaN ; NaN ; NaN ];
Tc_12  = [ NaN ; NaN ; NaN ];
omc_error_12 = [ NaN ; NaN ; NaN ];
Tc_error_12  = [ NaN ; NaN ; NaN ];

%-- Image #13:
omc_13 = [ 2.118713e+00 ; 1.546118e+00 ; 1.260701e-01 ];
Tc_13  = [ -1.041396e+02 ; -6.319941e+01 ; 6.342140e+02 ];
omc_error_13 = [ 1.562706e-02 ; 1.230726e-02 ; 2.973844e-02 ];
Tc_error_13  = [ 1.379641e+01 ; 1.265786e+01 ; 1.291948e+01 ];

%-- Image #14:
omc_14 = [ NaN ; NaN ; NaN ];
Tc_14  = [ NaN ; NaN ; NaN ];
omc_error_14 = [ NaN ; NaN ; NaN ];
Tc_error_14  = [ NaN ; NaN ; NaN ];

%-- Image #15:
omc_15 = [ 2.104485e+00 ; 2.183929e+00 ; 2.377985e-01 ];
Tc_15  = [ -6.490415e+01 ; -1.325915e+02 ; 1.094328e+03 ];
omc_error_15 = [ 2.169306e-02 ; 2.346805e-02 ; 5.481871e-02 ];
Tc_error_15  = [ 2.363960e+01 ; 2.182978e+01 ; 2.229427e+01 ];

%-- Image #16:
omc_16 = [ -1.768891e+00 ; -2.020773e+00 ; 6.015263e-01 ];
Tc_16  = [ 1.062528e+02 ; -1.230933e+02 ; 1.216621e+03 ];
omc_error_16 = [ 1.850766e-02 ; 1.927954e-02 ; 3.437597e-02 ];
Tc_error_16  = [ 2.629269e+01 ; 2.429412e+01 ; 2.156840e+01 ];

%-- Image #17:
omc_17 = [ 1.737240e+00 ; 1.649291e+00 ; 1.070228e+00 ];
Tc_17  = [ -1.818566e+02 ; -1.627022e+02 ; 9.663432e+02 ];
omc_error_17 = [ 1.917251e-02 ; 1.573514e-02 ; 2.914283e-02 ];
Tc_error_17  = [ 2.113848e+01 ; 1.954107e+01 ; 2.169327e+01 ];

%-- Image #18:
omc_18 = [ 2.006744e+00 ; 1.946812e+00 ; 5.410823e-01 ];
Tc_18  = [ -2.089308e+02 ; -1.282783e+02 ; 9.048841e+02 ];
omc_error_18 = [ 1.673841e-02 ; 1.555680e-02 ; 3.647813e-02 ];
Tc_error_18  = [ 1.991675e+01 ; 1.835940e+01 ; 1.991407e+01 ];

%-- Image #19:
omc_19 = [ 1.840732e+00 ; 1.868087e+00 ; -3.439566e-01 ];
Tc_19  = [ -6.485135e+01 ; -2.904916e+01 ; 9.731206e+02 ];
omc_error_19 = [ 1.436598e-02 ; 1.587985e-02 ; 3.004903e-02 ];
Tc_error_19  = [ 2.101397e+01 ; 1.936532e+01 ; 1.800085e+01 ];

%-- Image #20:
omc_20 = [ 1.798521e+00 ; 1.508789e+00 ; -3.118209e-01 ];
Tc_20  = [ -2.176319e+02 ; -7.913575e+00 ; 9.894892e+02 ];
omc_error_20 = [ 1.425858e-02 ; 1.673139e-02 ; 2.593729e-02 ];
Tc_error_20  = [ 2.153303e+01 ; 2.000526e+01 ; 2.063423e+01 ];

%-- Image #21:
omc_21 = [ -1.164142e+00 ; -1.921042e+00 ; -2.657785e-01 ];
Tc_21  = [ 6.773719e+01 ; -1.795463e+02 ; 9.489910e+02 ];
omc_error_21 = [ 1.254910e-02 ; 2.105078e-02 ; 2.673163e-02 ];
Tc_error_21  = [ 2.053409e+01 ; 1.897306e+01 ; 1.833702e+01 ];

%-- Image #22:
omc_22 = [ 1.562824e+00 ; 2.325795e+00 ; -8.301912e-01 ];
Tc_22  = [ 8.154157e+01 ; -3.380994e+01 ; 1.082823e+03 ];
omc_error_22 = [ 1.297450e-02 ; 1.915566e-02 ; 3.183661e-02 ];
Tc_error_22  = [ 2.332209e+01 ; 2.158365e+01 ; 1.891573e+01 ];

%-- Image #23:
omc_23 = [ 2.093298e+00 ; 2.345534e+00 ; 2.982011e-01 ];
Tc_23  = [ -1.036449e+02 ; -1.826701e+02 ; 1.330812e+03 ];
omc_error_23 = [ 3.335141e-02 ; 4.047894e-02 ; 8.356961e-02 ];
Tc_error_23  = [ 2.874845e+01 ; 2.667304e+01 ; 2.822120e+01 ];

%-- Image #24:
omc_24 = [ 2.069766e+00 ; 2.064649e+00 ; 6.188034e-01 ];
Tc_24  = [ -3.077400e+02 ; -1.084491e+02 ; 1.234477e+03 ];
omc_error_24 = [ 2.404611e-02 ; 2.284770e-02 ; 5.187185e-02 ];
Tc_error_24  = [ 2.683348e+01 ; 2.516569e+01 ; 2.915231e+01 ];

%-- Image #25:
omc_25 = [ -1.596711e+00 ; -2.141652e+00 ; 3.727149e-01 ];
Tc_25  = [ -1.578224e+01 ; -1.428397e+02 ; 1.385505e+03 ];
omc_error_25 = [ 1.715800e-02 ; 2.194923e-02 ; 3.560532e-02 ];
Tc_error_25  = [ 2.983315e+01 ; 2.760822e+01 ; 2.569911e+01 ];

%-- Image #26:
omc_26 = [ 1.836605e+00 ; 1.900298e+00 ; -3.379614e-01 ];
Tc_26  = [ -1.642082e+02 ; -1.107275e+01 ; 1.340028e+03 ];
omc_error_26 = [ 1.467289e-02 ; 1.896329e-02 ; 3.298919e-02 ];
Tc_error_26  = [ 2.902679e+01 ; 2.682776e+01 ; 2.606635e+01 ];

