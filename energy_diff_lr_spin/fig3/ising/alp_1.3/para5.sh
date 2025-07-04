#!/bin/sh

#PBS -q F1cpu                                                                                                                            
#PBS -l select=1:ncpus=128:mpiprocs=1:ompthreads=128                                                                                         
#PBS -l walltime=24:00:00

mkdir e00
cp e.exe e00/e00.exe
cd e00
touch b.d
echo 101 > b.d
time ./e00.exe > ./output.log 2>&1 &
cd ..

mkdir e01
cp e.exe e01/e01.exe
cd e01
touch b.d
echo 201 > b.d
time ./e01.exe > ./output.log 2>&1 &
cd ..

mkdir e02
cp e.exe e02/e02.exe
cd e02
touch b.d
echo 301 > b.d
./e02.exe > ./output.log 2>&1 &
cd ..

mkdir e03
cp e.exe e03/e03.exe
cd e03
touch b.d
echo 401 > b.d
./e03.exe > ./output.log 2>&1 &
cd ..

mkdir e04
cp e.exe e04/e04.exe
cd e04
touch b.d
echo 501 > b.d
./e04.exe > ./output.log 2>&1 &
cd ..

mkdir e05
cp e.exe e05/e05.exe
cd e05
touch b.d
echo 601 > b.d
./e05.exe > ./output.log 2>&1 &
cd ..

mkdir e06
cp e.exe e06/e06.exe
cd e06
touch b.d
echo 701 > b.d
./e06.exe > ./output.log 2>&1 &
cd ..

mkdir e07
cp e.exe e07/e07.exe
cd e07
touch b.d
echo 801 > b.d
./e07.exe > ./output.log 2>&1 &
cd ..

mkdir e08
cp e.exe e08/e08.exe
cd e08
touch b.d
echo 901 > b.d
./e08.exe > ./output.log 2>&1 &
cd ..

mkdir e09
cp e.exe e09/e09.exe
cd e09
touch b.d
echo 102 > b.d
./e09.exe > ./output.log 2>&1 &
cd ..

mkdir e10
cp e.exe e10/e10.exe
cd e10
touch b.d
echo 202 > b.d
./e10.exe > ./output.log 2>&1 &
cd ..

mkdir e11
cp e.exe e11/e11.exe
cd e11
touch b.d
echo 302 > b.d
./e11.exe > ./output.log 2>&1 &
cd ..

mkdir e12
cp e.exe e12/e12.exe
cd e12
touch b.d
echo 402 > b.d
./e12.exe > ./output.log 2>&1 &
cd ..

mkdir e13
cp e.exe e13/e13.exe
cd e13
touch b.d
echo 502 > b.d
./e13.exe > ./output.log 2>&1 &
cd ..

mkdir e14
cp e.exe e14/e14.exe
cd e14
touch b.d
echo 602 > b.d
./e14.exe > ./output.log 2>&1 &
cd ..

mkdir e15
cp e.exe e15/e15.exe
cd e15
touch b.d
echo 702 > b.d
./e15.exe > ./output.log 2>&1 &
cd ..

mkdir e16
cp e.exe e16/e16.exe
cd e16
touch b.d
echo 802 > b.d
./e16.exe > ./output.log 2>&1 &
cd ..

mkdir e17
cp e.exe e17/e17.exe
cd e17
touch b.d
echo 902 > b.d
./e17.exe > ./output.log 2>&1 &
cd ..

mkdir e18
cp e.exe e18/e18.exe
cd e18
touch b.d
echo 103 > b.d
./e18.exe > ./output.log 2>&1 &
cd ..

mkdir e19
cp e.exe e19/e19.exe
cd e19
touch b.d
echo 203 > b.d
./e19.exe > ./output.log 2>&1 &
cd ..

mkdir e20
cp e.exe e20/e20.exe
cd e20
touch b.d
echo 303 > b.d
./e20.exe > ./output.log 2>&1 &
cd ..

mkdir e21
cp e.exe e21/e21.exe
cd e21
touch b.d
echo 403 > b.d
./e21.exe > ./output.log 2>&1 &
cd ..

mkdir e22
cp e.exe e22/e22.exe
cd e22
touch b.d
echo 503 > b.d
./e22.exe > ./output.log 2>&1 &
cd ..

mkdir e23
cp e.exe e23/e23.exe
cd e23
touch b.d
echo 603 > b.d
./e23.exe > ./output.log 2>&1 &
cd ..

mkdir e24
cp e.exe e24/e24.exe
cd e24
touch b.d
echo 703 > b.d
./e24.exe > ./output.log 2>&1 &
cd ..

mkdir e25
cp e.exe e25/e25.exe
cd e25
touch b.d
echo 803 > b.d
./e25.exe > ./output.log 2>&1 &
cd ..

mkdir e26
cp e.exe e26/e26.exe
cd e26
touch b.d
echo 903 > b.d
./e26.exe > ./output.log 2>&1 &
cd ..

mkdir e27
cp e.exe e27/e27.exe
cd e27
touch b.d
echo 104 > b.d
./e27.exe > ./output.log 2>&1 &
cd ..

mkdir e28
cp e.exe e28/e28.exe
cd e28
touch b.d
echo 105 > b.d
./e28.exe > ./output.log 2>&1 &
cd ..

mkdir e29
cp e.exe e29/e29.exe
cd e29
touch b.d
echo 205 > b.d
./e29.exe > ./output.log 2>&1 &
cd ..

mkdir e30
cp e.exe e30/e30.exe
cd e30
touch b.d
echo 305 > b.d
./e30.exe > ./output.log 2>&1 &
cd ..

mkdir e31
cp e.exe e31/e31.exe
cd e31
touch b.d
echo 405 > b.d
./e31.exe > ./output.log 2>&1 &
cd ..

mkdir e32
cp e.exe e32/e32.exe
cd e32
touch b.d
echo 505 > b.d
./e32.exe > ./output.log 2>&1 &
cd ..

mkdir e33
cp e.exe e33/e33.exe
cd e33
touch b.d
echo 605 > b.d
./e33.exe > ./output.log 2>&1 &
cd ..

mkdir e34
cp e.exe e34/e34.exe
cd e34
touch b.d
echo 705 > b.d
./e34.exe > ./output.log 2>&1 &
cd ..

mkdir e35
cp e.exe e35/e35.exe
cd e35
touch b.d
echo 805 > b.d
./e35.exe > ./output.log 2>&1 &
cd ..

mkdir e36
cp e.exe e36/e36.exe
cd e36
touch b.d
echo 905 > b.d
./e36.exe > ./output.log 2>&1 &
cd ..

mkdir e37
cp e.exe e37/e37.exe
cd e37
touch b.d
echo 106 > b.d
./e37.exe > ./output.log 2>&1 &
cd ..

mkdir e38
cp e.exe e38/e38.exe
cd e38
touch b.d
echo 206 > b.d
./e38.exe > ./output.log 2>&1 &
cd ..

mkdir e39
cp e.exe e39/e39.exe
cd e39
touch b.d
echo 306 > b.d
./e39.exe > ./output.log 2>&1 &
cd ..

mkdir e40
cp e.exe e40/e40.exe
cd e40
touch b.d
echo 406 > b.d
./e40.exe > ./output.log 2>&1 &
cd ..

mkdir e41
cp e.exe e41/e41.exe
cd e41
touch b.d
echo 506 > b.d
./e41.exe > ./output.log 2>&1 &
cd ..

mkdir e42
cp e.exe e42/e42.exe
cd e42
touch b.d
echo 606 > b.d
./e42.exe > ./output.log 2>&1 &
cd ..

mkdir e43
cp e.exe e43/e43.exe
cd e43
touch b.d
echo 706 > b.d
./e43.exe > ./output.log 2>&1 &
cd ..

mkdir e44
cp e.exe e44/e44.exe
cd e44
touch b.d
echo 806 > b.d
./e44.exe > ./output.log 2>&1 &
cd ..

mkdir e45
cp e.exe e45/e45.exe
cd e45
touch b.d
echo 906 > b.d
./e45.exe > ./output.log 2>&1 &
cd ..

mkdir e46
cp e.exe e46/e46.exe
cd e46
touch b.d
echo 107 > b.d
./e46.exe > ./output.log 2>&1 &
cd ..

mkdir e47
cp e.exe e47/e47.exe
cd e47
touch b.d
echo 207 > b.d
./e47.exe > ./output.log 2>&1 &
cd ..

mkdir e48
cp e.exe e48/e48.exe
cd e48
touch b.d
echo 307 > b.d
./e48.exe > ./output.log 2>&1 &
cd ..

mkdir e49
cp e.exe e49/e49.exe
cd e49
touch b.d
echo 407 > b.d
./e49.exe > ./output.log 2>&1 &
cd ..

mkdir e50
cp e.exe e50/e50.exe
cd e50
touch b.d
echo 507 > b.d
./e50.exe > ./output.log 2>&1 &
cd ..

mkdir e51
cp e.exe e51/e51.exe
cd e51
touch b.d
echo 607 > b.d
./e51.exe > ./output.log 2>&1 &
cd ..

mkdir e52
cp e.exe e52/e52.exe
cd e52
touch b.d
echo 707 > b.d
./e52.exe > ./output.log 2>&1 &
cd ..

mkdir e53
cp e.exe e53/e53.exe
cd e53
touch b.d
echo 807 > b.d
./e53.exe > ./output.log 2>&1 &
cd ..

mkdir e54
cp e.exe e54/e54.exe
cd e54
touch b.d
echo 907 > b.d
./e54.exe > ./output.log 2>&1 &
cd ..

mkdir e55
cp e.exe e55/e55.exe
cd e55
touch b.d
echo 108 > b.d
./e55.exe > ./output.log 2>&1 &
cd ..

mkdir e56
cp e.exe e56/e56.exe
cd e56
touch b.d
echo 208 > b.d
./e56.exe > ./output.log 2>&1 &
cd ..

mkdir e57
cp e.exe e57/e57.exe
cd e57
touch b.d
echo 308 > b.d
./e57.exe > ./output.log 2>&1 &
cd ..

mkdir e58
cp e.exe e58/e58.exe
cd e58
touch b.d
echo 408 > b.d
./e58.exe > ./output.log 2>&1 &
cd ..

mkdir e59
cp e.exe e59/e59.exe
cd e59
touch b.d
echo 508 > b.d
./e59.exe > ./output.log 2>&1 &
cd ..

mkdir e60
cp e.exe e60/e60.exe
cd e60
touch b.d
echo 608 > b.d
./e60.exe > ./output.log 2>&1 &
cd ..

mkdir e61
cp e.exe e61/e61.exe
cd e61
touch b.d
echo 708 > b.d
./e61.exe > ./output.log 2>&1 &
cd ..

mkdir e62
cp e.exe e62/e62.exe
cd e62
touch b.d
echo 808 > b.d
./e62.exe > ./output.log 2>&1 &
cd ..

mkdir e63
cp e.exe e63/e63.exe
cd e63
touch b.d
echo 908 > b.d
./e63.exe > ./output.log 2>&1 &
cd ..

mkdir e64
cp e.exe e64/e64.exe
cd e64
touch b.d
echo 109 > b.d
./e64.exe > ./output.log 2>&1 &
cd ..

mkdir e65
cp e.exe e65/e65.exe
cd e65
touch b.d
echo 209 > b.d
./e65.exe > ./output.log 2>&1 &
cd ..

mkdir e66
cp e.exe e66/e66.exe
cd e66
touch b.d
echo 309 > b.d
./e66.exe > ./output.log 2>&1 &
cd ..

mkdir e67
cp e.exe e67/e67.exe
cd e67
touch b.d
echo 409 > b.d
./e67.exe > ./output.log 2>&1 &
cd ..

mkdir e68
cp e.exe e68/e68.exe
cd e68
touch b.d
echo 509 > b.d
./e68.exe > ./output.log 2>&1 &
cd ..

mkdir e69
cp e.exe e69/e69.exe
cd e69
touch b.d
echo 609 > b.d
./e69.exe > ./output.log 2>&1 &
cd ..

mkdir e70
cp e.exe e70/e70.exe
cd e70
touch b.d
echo 709 > b.d
./e70.exe > ./output.log 2>&1 &
cd ..

mkdir e71
cp e.exe e71/e71.exe
cd e71
touch b.d
echo 809 > b.d
./e71.exe > ./output.log 2>&1 &
cd ..

mkdir e72
cp e.exe e72/e72.exe
cd e72
touch b.d
echo 909 > b.d
./e72.exe > ./output.log 2>&1 &
cd ..

mkdir e73
cp e.exe e73/e73.exe
cd e73
touch b.d
echo 110 > b.d
./e73.exe > ./output.log 2>&1 &
cd ..

mkdir e74
cp e.exe e74/e74.exe
cd e74
touch b.d
echo 111 > b.d
./e74.exe > ./output.log 2>&1 &
cd ..

mkdir e75
cp e.exe e75/e75.exe
cd e75
touch b.d
echo 112 > b.d
./e75.exe > ./output.log 2>&1 &
cd ..

mkdir e76
cp e.exe e76/e76.exe
cd e76
touch b.d
echo 113 > b.d
./e76.exe > ./output.log 2>&1 &
cd ..

mkdir e77
cp e.exe e77/e77.exe
cd e77
touch b.d
echo 114 > b.d
./e77.exe > ./output.log 2>&1 &
cd ..

mkdir e78
cp e.exe e78/e78.exe
cd e78
touch b.d
echo 115 > b.d
./e78.exe > ./output.log 2>&1 &
cd ..

mkdir e79
cp e.exe e79/e79.exe
cd e79
touch b.d
echo 116 > b.d
./e79.exe > ./output.log 2>&1 &
cd ..

mkdir e80
cp e.exe e80/e80.exe
cd e80
touch b.d
echo 117 > b.d
./e80.exe > ./output.log 2>&1 &
cd ..

mkdir e81
cp e.exe e81/e81.exe
cd e81
touch b.d
echo 118 > b.d
./e81.exe > ./output.log 2>&1 &
cd ..

mkdir e82
cp e.exe e82/e82.exe
cd e82
touch b.d
echo 119 > b.d
./e82.exe > ./output.log 2>&1 &
cd ..

mkdir e83
cp e.exe e83/e83.exe
cd e83
touch b.d
echo 210 > b.d
./e83.exe > ./output.log 2>&1 &
cd ..

mkdir e84
cp e.exe e84/e84.exe
cd e84
touch b.d
echo 211 > b.d
./e84.exe > ./output.log 2>&1 &
cd ..

mkdir e85
cp e.exe e85/e85.exe
cd e85
touch b.d
echo 212 > b.d
./e85.exe > ./output.log 2>&1 &
cd ..

mkdir e86
cp e.exe e86/e86.exe
cd e86
touch b.d
echo 213 > b.d
./e86.exe > ./output.log 2>&1 &
cd ..

mkdir e87
cp e.exe e87/e87.exe
cd e87
touch b.d
echo 214 > b.d
./e87.exe > ./output.log 2>&1 &
cd ..

mkdir e88
cp e.exe e88/e88.exe
cd e88
touch b.d
echo 215 > b.d
./e88.exe > ./output.log 2>&1 &
cd ..

mkdir e89
cp e.exe e89/e89.exe
cd e89
touch b.d
echo 216 > b.d
./e89.exe > ./output.log 2>&1 &
cd ..

mkdir e90
cp e.exe e90/e90.exe
cd e90
touch b.d
echo 217 > b.d
./e90.exe > ./output.log 2>&1 &
cd ..

mkdir e91
cp e.exe e91/e91.exe
cd e91
touch b.d
echo 218 > b.d
./e91.exe > ./output.log 2>&1 &
cd ..

mkdir e92
cp e.exe e92/e92.exe
cd e92
touch b.d
echo 219 > b.d
./e92.exe > ./output.log 2>&1 &
cd ..

mkdir e93
cp e.exe e93/e93.exe
cd e93
touch b.d
echo 310 > b.d
./e93.exe > ./output.log 2>&1 &
cd ..

mkdir e94
cp e.exe e94/e94.exe
cd e94
touch b.d
echo 311 > b.d
./e94.exe > ./output.log 2>&1 &
cd ..

mkdir e95
cp e.exe e95/e95.exe
cd e95
touch b.d
echo 312 > b.d
./e95.exe > ./output.log 2>&1 &
cd ..

mkdir e96
cp e.exe e96/e96.exe
cd e96
touch b.d
echo 313 > b.d
./e96.exe > ./output.log 2>&1 &
cd ..

mkdir e97
cp e.exe e97/e97.exe
cd e97
touch b.d
echo 314 > b.d
./e97.exe > ./output.log 2>&1 &
cd ..

mkdir e98
cp e.exe e98/e98.exe
cd e98
touch b.d
echo 315 > b.d
./e98.exe > ./output.log 2>&1 &
cd ..

mkdir e99
cp e.exe e99/e99.exe
cd e99
touch b.d
echo 316 > b.d
./e99.exe > ./output.log 2>&1 &
cd ..

mkdir e100
cp e.exe e100/e100.exe
cd e100
touch b.d
echo 1011 > b.d
./e100.exe > ./output.log 2>&1 &
cd ..

mkdir e101
cp e.exe e101/e101.exe
cd e101
touch b.d
echo 2011 > b.d
./e101.exe > ./output.log 2>&1 &
cd ..

mkdir e102
cp e.exe e102/e102.exe
cd e102
touch b.d
echo 3011 > b.d
./e102.exe > ./output.log 2>&1 &
cd ..

mkdir e103
cp e.exe e103/e103.exe
cd e103
touch b.d
echo 4011 > b.d
./e103.exe > ./output.log 2>&1 &
cd ..

mkdir e104
cp e.exe e104/e104.exe
cd e104
touch b.d
echo 5011 > b.d
./e104.exe > ./output.log 2>&1 &
cd ..

mkdir e105
cp e.exe e105/e105.exe
cd e105
touch b.d
echo 6011 > b.d
./e105.exe > ./output.log 2>&1 &
cd ..

mkdir e106
cp e.exe e106/e106.exe
cd e106
touch b.d
echo 7011 > b.d
./e106.exe > ./output.log 2>&1 &
cd ..

mkdir e107
cp e.exe e107/e107.exe
cd e107
touch b.d
echo 8011 > b.d
./e107.exe > ./output.log 2>&1 &
cd ..

mkdir e108
cp e.exe e108/e108.exe
cd e108
touch b.d
echo 9011 > b.d
./e108.exe > ./output.log 2>&1 &
cd ..

mkdir e109
cp e.exe e109/e109.exe
cd e109
touch b.d
echo 1021 > b.d
./e109.exe > ./output.log 2>&1 &
cd ..

mkdir e110
cp e.exe e110/e110.exe
cd e110
touch b.d
echo 2021 > b.d
./e110.exe > ./output.log 2>&1 &
cd ..

mkdir e111
cp e.exe e111/e111.exe
cd e111
touch b.d
echo 3021 > b.d
./e111.exe > ./output.log 2>&1 &
cd ..

mkdir e112
cp e.exe e112/e112.exe
cd e112
touch b.d
echo 4021 > b.d
./e112.exe > ./output.log 2>&1 &
cd ..

mkdir e113
cp e.exe e113/e113.exe
cd e113
touch b.d
echo 5021 > b.d
./e113.exe > ./output.log 2>&1 &
cd ..

mkdir e114
cp e.exe e114/e114.exe
cd e114
touch b.d
echo 6021 > b.d
./e114.exe > ./output.log 2>&1 &
cd ..

mkdir e115
cp e.exe e115/e115.exe
cd e115
touch b.d
echo 7021 > b.d
./e115.exe > ./output.log 2>&1 &
cd ..

mkdir e116
cp e.exe e116/e116.exe
cd e116
touch b.d
echo 8021 > b.d
./e116.exe > ./output.log 2>&1 &
cd ..

mkdir e117
cp e.exe e117/e117.exe
cd e117
touch b.d
echo 9021 > b.d
./e117.exe > ./output.log 2>&1 &
cd ..

mkdir e118
cp e.exe e118/e118.exe
cd e118
touch b.d
echo 1031 > b.d
./e118.exe > ./output.log 2>&1 &
cd ..

mkdir e119
cp e.exe e119/e119.exe
cd e119
touch b.d
echo 2031 > b.d
./e119.exe > ./output.log 2>&1 &
cd ..

mkdir e120
cp e.exe e120/e120.exe
cd e120
touch b.d
echo 3031 > b.d
./e120.exe > ./output.log 2>&1 &
cd ..

mkdir e121
cp e.exe e121/e121.exe
cd e121
touch b.d
echo 4031 > b.d
./e121.exe > ./output.log 2>&1 &
cd ..

mkdir e122
cp e.exe e122/e122.exe
cd e122
touch b.d
echo 5031 > b.d
./e122.exe > ./output.log 2>&1 &
cd ..

mkdir e123
cp e.exe e123/e123.exe
cd e123
touch b.d
echo 6031 > b.d
./e123.exe > ./output.log 2>&1 &
cd ..

mkdir e124
cp e.exe e124/e124.exe
cd e124
touch b.d
echo 7031 > b.d
./e124.exe > ./output.log 2>&1 &
cd ..

mkdir e125
cp e.exe e125/e125.exe
cd e125
touch b.d
echo 8031 > b.d
./e125.exe > ./output.log 2>&1 &
cd ..

mkdir e126
cp e.exe e126/e126.exe
cd e126
touch b.d
echo 9031 > b.d
./e126.exe > ./output.log 2>&1 &
cd ..

mkdir e127
cp e.exe e127/e127.exe
cd e127
touch b.d
echo 1014 > b.d
./e127.exe > ./output.log 2>&1 &
cd ..

wait
