#!/usr/bin/env bash
#SBATCH -o compile.out
#SBATCH -e compile.err
#SBATCH -t 47:55:00
#SBATCH -p risc5

#export LDFLAGS="-fuse-ld=lld"
export CC=/home/ubuntu/git/llvm-project-21/opt/bin/clang
export CXX=/home/ubuntu/git/llvm-project-21/opt/bin/clang++
export CHPL_TARGET_CC=$CC
export CHPL_TARGET_CXX=$CXX
export CHPL_HOST_COMPILER=llvm
export CHPL_HOST_CC=$CC
export CHPL_HOST_CXX=$CXX
export CHPL_LDFLAGS="-fuse-ld=lld"
export CHPL_COMM=none
export CHPL_TARGET_MEM=mimalloc
export CHPL_HOST_MEM=mimalloc
export CHPL_LLVM=system
export CHPL_LLVM_TARGETS_TO_BUILD=host
#export CHPL_TARGET_CPU=sifive-u74
#export CHPL_TARGET_CPU=sifive-p550
export CHPL_TARGET_CPU=native

./configure --prefix=/home/ubuntu/chapel

make -j32
