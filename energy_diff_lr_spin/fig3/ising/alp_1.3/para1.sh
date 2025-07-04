#!/bin/sh
#PBS -q B4cpu
#PBS -l select=1:ncpus=8:mpiprocs=1:ompthreads=8
#PBS -l walltime=12:00:00

env OMP_NUM_THREADS=4 ./out.exe > ./output.log 2>&1 &

env OMP_NUM_THREADS=4 ./out.exe > ./output.log 2>&1 &

wait
