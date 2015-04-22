import numpy as np
import cv2
from Tkinter import *
from PIL import Image, ImageTk
from sympy import sqrt
from lmfit import minimize, Parameters, Parameter, fit_report

#Camera parameters
fc = np.array([313.185205687689290, 312.634348462007840])
cc = np.array([217.924273865532680, 127.719511013538310])
kc = np.array([0.120594447004112, -0.211027111434246, 0.002419877275468, -0.002228812901654, 0.000000000000000])
nx = 432
ny = 240
R = np.array([[1, 0, 0],
              [0, 1, 0],
              [0, 0, 1]])
cameraMatrix = np.array([[fc[0], 0, cc[0]],
                         [0, fc[1], cc[1]],
                         [0, 0, 1]])

#Undistortion
def undistor(img):
    map1, map2 = cv2.initUndistortRectifyMap(cameraMatrix, kc, R, cameraMatrix, (nx, ny), cv2.CV_32FC1)
    undist = cv2.remap(img, map1, map2, cv2.INTER_LINEAR)
    return undist

#Files
f = open('results/test9.txt', 'w')
f_error = open('results/test9_error.txt', 'w')
f_input = open('results/test9_input.txt', 'r')

#get first frame
cap = cv2.VideoCapture('video/test9.avi')
ret, first_frame = cap.read()
first_frame = undistor(first_frame)

#read coordinates from file
src = []
for i in xrange(4):
    src.append([float(f_input.readline()), float(f_input.readline())])

#Homography matrix
# cx, cy - cell number
cx = 8.0
cy = 5.0
src = np.array(src)
dst = np.array([[0.0, 0.0], [cx, 0.0], [cx, cy], [0.0, cy]])
ret = cv2.findHomography(dst, src)
H = ret[0]

#coordinates chess points
points = []
for i in range(int(cx)+1):
    for j in range(int(cy)+1):
        coord = H*np.mat([[i], [j], [1.0]])
        x = coord[0, 0]/coord[2, 0]
        y = coord[1, 0]/coord[2, 0]
        points.append([x, y])

#subpix accurate
first_gray = cv2.cvtColor(first_frame, cv2.COLOR_BGR2GRAY)

cor = []
for i in range(len(points)):
    points[i] = np.array(points[i], np.float32)
    cor.append([[points[i][0], points[i][1]]])
cor = np.array(cor)

criteria = (cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER, 100, 0.001)
cv2.cornerSubPix(first_gray, cor, (3, 3), (-1, -1), criteria)

# coordinates of chessboard: template -> image(with given angle and translation)
def transformation(angle, translation):
    rotation_matrix, jac = cv2.Rodrigues(angle)
    transform = np.mat([[rotation_matrix[0, 0], rotation_matrix[0, 1], rotation_matrix[0, 2], translation[0]],
                        [rotation_matrix[1, 0], rotation_matrix[1, 1], rotation_matrix[1, 2], translation[1]],
                        [rotation_matrix[2, 0], rotation_matrix[2, 1], rotation_matrix[2, 2], translation[2]]])
    coordinates = []
    for i in range(int(cx)+1):
        for j in range(int(cy)+1):
            p = np.mat([[i],
                        [j],
                        [0],
                        [1.0]])
            c = cameraMatrix * transform * p
            coordinates.append(c[0, 0]/c[2, 0])
            coordinates.append(c[1, 0]/c[2, 0])
    return np.array(coordinates)


# define objective function: returns the array to be minimized
# params - class Parameters from lmfit
# data - coordinates that should be
def residual(params, data):
    vals = params.valuesdict()
    angle_fit = np.zeros((3, 1))
    angle_fit[0, 0] = vals['angle0']
    angle_fit[1, 0] = vals['angle1']
    angle_fit[2, 0] = vals['angle2']
    translation_fit = np.zeros(3)
    translation_fit[0] = vals['translation0']
    translation_fit[1] = vals['translation1']
    translation_fit[2] = vals['translation2']
    model = transformation(angle_fit, translation_fit)
    return model - data

# calculate position, H - homography matrix, coordinates - coordinates of points that we know
def position(H, coordinates):
    #first approximation
    Q = np.mat(cameraMatrix).I*H
    h1 = [Q[0, 0], Q[1, 0], Q[2, 0]]
    h2 = [Q[0, 1], Q[1, 1], Q[2, 1]]
    t = [Q[0, 2], Q[1, 2], Q[2, 2]]
    h2 = np.mat(h2) - (np.dot(h1, h2)/np.dot(h1, h1)) * np.mat(h1)
    h2 = [h2[0, 0], h2[0, 1], h2[0, 2]]
    h2 = np.mat(h2)/sqrt(np.dot(h2, h2))
    h2 = [h2[0, 0], h2[0, 1], h2[0, 2]]
    h1 = np.mat(h1)/sqrt(np.dot(h1, h1))
    h1 = [h1[0, 0], h1[0, 1], h1[0, 2]]
    h3 = np.cross(h1, h2)
    R1 = np.array([[h1[0], h2[0], h3[0]],
                  [h1[1], h2[1], h3[1]],
                  [h1[2], h2[2], h3[2]]], np.float64)

    ang, jac = cv2.Rodrigues(R1)

    # create data to be fitted
    data = []
    for i in range(len(coordinates)):
        data.append(coordinates[i][0, 0])
        data.append(coordinates[i][0, 1])
    data = np.array(data)

    # create a set of Parameters
    params = Parameters()
    params.add('angle0',   value= ang[0, 0])
    params.add('angle1',   value= ang[1, 0])
    params.add('angle2',   value= ang[2, 0])
    params.add('translation0', value= t[0])
    params.add('translation1', value= t[1])
    params.add('translation2', value= t[2])

    # do fit, here with leastsq model
    result = minimize(residual, params, args=(data, ))

    return params


# write in file
def write(params, cor, f):
    data = []
    for i in range(len(cor)):
        data.append(cor[i][0, 0])
        data.append(cor[i][0, 1])
    data = np.array(data)
    f.write(str(params['translation0'].value) + ' ' + str(params['translation1'].value) + ' ' + str(params['translation2'].value) + '\n')
    f_error.write(str(np.mean(abs(residual(params, data)))) + '\n')


# first position
p = position(H, cor)
write(p, cor, f)

# Parameters for lucas kanade optical flow
lk_params = dict( winSize  = (15,15),
                  maxLevel = 2,
                  criteria = (cv2.TERM_CRITERIA_EPS | cv2.TERM_CRITERIA_COUNT, 10, 0.03))

#lucas kanade
old_frame = first_frame
old_gray = first_gray
# Create a mask image for drawing purposes
mask = np.zeros_like(old_frame)

while(1):
    ret, frame = cap.read()
    if frame == None:
        cv2.waitKey()
        break

    frame = undistor(frame)
    frame_gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # calculate optical flow
    p1, st, err = cv2.calcOpticalFlowPyrLK(old_gray, frame_gray, cor, None, **lk_params)

    # Select good points
    good_new = p1[st==1]
    good_old = cor[st==1]

    # draw the tracks
    for i, (new, old) in enumerate(zip(good_new, good_old)):
        a, b = new.ravel()
        c, d = old.ravel()
        cv2.line(mask, (a, b), (c, d), (0, 255, 0), 0)
        cv2.circle(frame, (a, b), 1, (0, 255, 0), -1)

    img = cv2.add(frame, mask)

    cv2.imshow('frame', img)
    cv2.waitKey(50)

    # Now update the previous frame and previous points
    old_gray = frame_gray.copy()
    cor = good_new.reshape(-1, 1, 2)

    # Write camera position
    p = position(H, cor)
    write(p, cor, f)

f.close()
f_error.close()
f_input.close()
cv2.destroyAllWindows()
cap.release()
