% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 313.185205687689290 ; 312.634348462007840 ];

%-- Principal point:
cc = [ 217.924273865532680 ; 127.719511013538310 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.120594447004112 ; -0.211027111434246 ; 0.002419877275468 ; -0.002228812901654 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 3.149879022308815 ; 3.186781070062521 ];

%-- Principal point uncertainty:
cc_error = [ 1.741871541025843 ; 1.604067975278213 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.014547683759768 ; 0.035093456487445 ; 0.001820352031141 ; 0.001879166668683 ; 0.000000000000000 ];

%-- Image size:
nx = 432;
ny = 240;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 22;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 2.217737e+00 ; 2.006065e+00 ; 2.794516e-01 ];
Tc_1  = [ -1.533934e+01 ; -3.114241e+00 ; 4.362414e+01 ];
omc_error_1 = [ 5.192809e-03 ; 4.603325e-03 ; 1.044789e-02 ];
Tc_error_1  = [ 2.501482e-01 ; 2.294078e-01 ; 4.886413e-01 ];

%-- Image #2:
omc_2 = [ NaN ; NaN ; NaN ];
Tc_2  = [ NaN ; NaN ; NaN ];
omc_error_2 = [ NaN ; NaN ; NaN ];
Tc_error_2  = [ NaN ; NaN ; NaN ];

%-- Image #3:
omc_3 = [ 2.087644e+00 ; 1.906105e+00 ; 4.078387e-01 ];
Tc_3  = [ -1.886906e+01 ; -6.215481e+00 ; 4.346573e+01 ];
omc_error_3 = [ 5.016931e-03 ; 4.957601e-03 ; 9.957387e-03 ];
Tc_error_3  = [ 2.525858e-01 ; 2.316631e-01 ; 5.065617e-01 ];

%-- Image #4:
omc_4 = [ -2.148081e+00 ; -2.005164e+00 ; 2.268911e-01 ];
Tc_4  = [ 4.892324e+00 ; -6.760533e+00 ; 5.414850e+01 ];
omc_error_4 = [ 7.383823e-03 ; 8.607581e-03 ; 1.565576e-02 ];
Tc_error_4  = [ 3.059821e-01 ; 2.766558e-01 ; 5.611813e-01 ];

%-- Image #5:
omc_5 = [ 2.142062e+00 ; 2.032414e+00 ; 3.042335e-01 ];
Tc_5  = [ -2.026020e+01 ; -4.341993e+00 ; 4.543958e+01 ];
omc_error_5 = [ 5.562442e-03 ; 5.871580e-03 ; 1.196679e-02 ];
Tc_error_5  = [ 2.621319e-01 ; 2.432316e-01 ; 5.350445e-01 ];

%-- Image #6:
omc_6 = [ -2.198353e+00 ; -2.143272e+00 ; -4.245925e-01 ];
Tc_6  = [ -1.870118e+01 ; -1.383287e+01 ; 4.711012e+01 ];
omc_error_6 = [ 6.926070e-03 ; 5.433122e-03 ; 1.334509e-02 ];
Tc_error_6  = [ 2.724314e-01 ; 2.534458e-01 ; 5.587435e-01 ];

%-- Image #7:
omc_7 = [ 2.225396e+00 ; 2.061262e+00 ; 7.494527e-02 ];
Tc_7  = [ -1.642913e+01 ; -4.185914e+00 ; 5.128037e+01 ];
omc_error_7 = [ 6.282588e-03 ; 6.470300e-03 ; 1.371611e-02 ];
Tc_error_7  = [ 2.899003e-01 ; 2.675641e-01 ; 5.666812e-01 ];

%-- Image #8:
omc_8 = [ 2.163949e+00 ; 2.002713e+00 ; 3.069684e-01 ];
Tc_8  = [ -2.281200e+01 ; -1.086084e+00 ; 5.025403e+01 ];
omc_error_8 = [ 6.598318e-03 ; 6.556341e-03 ; 1.354164e-02 ];
Tc_error_8  = [ 2.885509e-01 ; 2.692603e-01 ; 6.011241e-01 ];

%-- Image #9:
omc_9 = [ -2.255885e+00 ; -1.982449e+00 ; 9.279940e-02 ];
Tc_9  = [ 2.725554e+00 ; -5.826481e+00 ; 5.656088e+01 ];
omc_error_9 = [ 6.720018e-03 ; 7.605928e-03 ; 1.498025e-02 ];
Tc_error_9  = [ 3.171152e-01 ; 2.890424e-01 ; 5.815337e-01 ];

%-- Image #10:
omc_10 = [ NaN ; NaN ; NaN ];
Tc_10  = [ NaN ; NaN ; NaN ];
omc_error_10 = [ NaN ; NaN ; NaN ];
Tc_error_10  = [ NaN ; NaN ; NaN ];

%-- Image #11:
omc_11 = [ 2.205399e+00 ; 2.195564e+00 ; 3.050245e-02 ];
Tc_11  = [ -1.917468e+01 ; -9.854943e+00 ; 5.084553e+01 ];
omc_error_11 = [ 5.020529e-03 ; 6.179969e-03 ; 1.273717e-02 ];
Tc_error_11  = [ 2.858675e-01 ; 2.674913e-01 ; 5.766540e-01 ];

%-- Image #12:
omc_12 = [ 2.084652e+00 ; 2.021021e+00 ; -2.771786e-01 ];
Tc_12  = [ -1.657158e+01 ; -8.437698e+00 ; 5.227218e+01 ];
omc_error_12 = [ 4.023178e-03 ; 5.310890e-03 ; 9.397320e-03 ];
Tc_error_12  = [ 2.904577e-01 ; 2.710991e-01 ; 5.503165e-01 ];

%-- Image #13:
omc_13 = [ -2.062222e+00 ; -2.080284e+00 ; -4.612858e-01 ];
Tc_13  = [ -1.382102e+01 ; -8.056898e+00 ; 5.171270e+01 ];
omc_error_13 = [ 4.869029e-03 ; 5.434302e-03 ; 1.030790e-02 ];
Tc_error_13  = [ 2.915192e-01 ; 2.694927e-01 ; 5.743626e-01 ];

%-- Image #14:
omc_14 = [ -2.089864e+00 ; -2.012553e+00 ; -4.310562e-01 ];
Tc_14  = [ -1.271087e+01 ; -1.313259e+01 ; 4.913117e+01 ];
omc_error_14 = [ 5.479576e-03 ; 5.413463e-03 ; 1.081146e-02 ];
Tc_error_14  = [ 2.799153e-01 ; 2.583968e-01 ; 5.493172e-01 ];

%-- Image #15:
omc_15 = [ 2.016310e+00 ; 1.956169e+00 ; -3.949153e-01 ];
Tc_15  = [ -1.263040e+01 ; -1.460788e+00 ; 5.327405e+01 ];
omc_error_15 = [ 4.573176e-03 ; 5.222552e-03 ; 9.217530e-03 ];
Tc_error_15  = [ 2.930487e-01 ; 2.745315e-01 ; 5.299536e-01 ];

%-- Image #16:
omc_16 = [ 1.920388e+00 ; 1.861756e+00 ; 3.549890e-01 ];
Tc_16  = [ -2.287051e+01 ; -5.983419e+00 ; 4.664101e+01 ];
omc_error_16 = [ 4.917662e-03 ; 5.674009e-03 ; 9.442458e-03 ];
Tc_error_16  = [ 2.709175e-01 ; 2.516166e-01 ; 5.512075e-01 ];

%-- Image #17:
omc_17 = [ -2.045799e+00 ; -2.035672e+00 ; 3.070208e-01 ];
Tc_17  = [ -2.504758e+00 ; -1.066889e+01 ; 5.673557e+01 ];
omc_error_17 = [ 5.793702e-03 ; 6.038549e-03 ; 1.216157e-02 ];
Tc_error_17  = [ 3.165873e-01 ; 2.891232e-01 ; 5.582297e-01 ];

%-- Image #18:
omc_18 = [ 2.035897e+00 ; 2.123011e+00 ; 9.567290e-02 ];
Tc_18  = [ -1.972018e+01 ; -2.929542e+01 ; 8.098194e+01 ];
omc_error_18 = [ 5.044867e-03 ; 8.248118e-03 ; 1.446391e-02 ];
Tc_error_18  = [ 4.655656e-01 ; 4.273479e-01 ; 9.424447e-01 ];

%-- Image #19:
omc_19 = [ 1.919196e+00 ; 2.070710e+00 ; -6.640781e-02 ];
Tc_19  = [ -2.055171e+01 ; -2.602996e+00 ; 7.994060e+01 ];
omc_error_19 = [ 7.935284e-03 ; 9.979288e-03 ; 1.734041e-02 ];
Tc_error_19  = [ 4.476885e-01 ; 4.153482e-01 ; 8.563490e-01 ];

%-- Image #20:
omc_20 = [ 2.102573e+00 ; 2.267703e+00 ; 2.476089e-01 ];
Tc_20  = [ -2.383558e+01 ; -2.786898e+01 ; 8.349974e+01 ];
omc_error_20 = [ 8.217853e-03 ; 1.399705e-02 ; 2.567751e-02 ];
Tc_error_20  = [ 4.800811e-01 ; 4.411050e-01 ; 9.868784e-01 ];

%-- Image #21:
omc_21 = [ -2.193484e+00 ; -2.135807e+00 ; -1.719185e-01 ];
Tc_21  = [ -3.056483e+00 ; -2.252382e+01 ; 7.975528e+01 ];
omc_error_21 = [ 1.168675e-02 ; 1.073683e-02 ; 2.252643e-02 ];
Tc_error_21  = [ 4.515355e-01 ; 4.165096e-01 ; 8.999210e-01 ];

%-- Image #22:
omc_22 = [ 2.116795e+00 ; 1.882776e+00 ; 4.153661e-01 ];
Tc_22  = [ -2.521107e+01 ; -2.645464e+01 ; 7.723892e+01 ];
omc_error_22 = [ 5.746572e-03 ; 8.062072e-03 ; 1.400757e-02 ];
Tc_error_22  = [ 4.479833e-01 ; 4.103541e-01 ; 9.514751e-01 ];

