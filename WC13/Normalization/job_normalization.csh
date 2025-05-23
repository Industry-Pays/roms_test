#!/bin/csh -f
#
# git $Id$
#######################################################################
# Copyright (c) 2002-2025 The ROMS Group                              #
#   Licensed under a MIT/X style license                              #
#   See License_ROMS.md                                               #
#######################################################################
#                                                                     #
# 4D-Var error covariance normalization coefficients job CSH script:  #
#                                                                     #
# This script NEEDS to be run before any run:                         #
#                                                                     #
#   (1) It copies a new clean nonlinear model initial conditions      #
#       file. The nonlinear model is initialized from the             #
#       background or reference state.                                #
#   (2) Specify model, initial conditions, boundary conditions, and   #
#       surface forcing error convariance input standard deviations   #
#       files.                                                        #
#   (3) Specify model, initial conditions, boundary conditions, and   #
#       surface forcing error convariance input/output normalization  #
#       factors filenames.                                            #
#   (4) Create 4D-Var input script "c4dvar.in" from a template and    #
#       specify the error covariance standard deviation, and error    #
#       covariance normalization factors files to be used.            #
#                                                                     #
#######################################################################

 echo ' '
 echo '4D-Var Error Covariance Normalization Coefficients Configuration:'
 echo ' '

# Set path definition to one directory up in the tree.

 set Dir=`dirname ${PWD}`

# Set string manipulations perl script.

 set SUBSTITUTE=${ROMS_ROOT}/ROMS/Bin/substitute

# Set model, initial conditions, boundary conditions and surface
# forcing error covariance standard deviations files.

 set STDnameM=../Data/wc13_std_m.nc
 set STDnameI=../Data/wc13_std_i.nc
 set STDnameB=../Data/wc13_std_b.nc
 set STDnameF=../Data/wc13_std_f.nc

# Set output file for standard deviation computed/modeled from background
# (prior) state.

 set STDnameC=wc13_std_computed.nc

# Set model, initial conditions, boundary conditions and surface
# forcing error covariance normalization factors filenames.

 set NRMnameM=wc13_nrm_m.nc
 set NRMnameI=wc13_nrm_i.nc
 set NRMnameB=wc13_nrm_b.nc
 set NRMnameF=wc13_nrm_f.nc

# Modify 4D-Var template input script and specify above files.

 set NORM=c4dvar.in
 if (-e $NORM) then
   /bin/rm $NORM
 endif
 cp -v s4dvar.in $NORM

 $SUBSTITUTE $NORM roms_std_m.nc $STDnameM
 $SUBSTITUTE $NORM roms_std_i.nc $STDnameI
 $SUBSTITUTE $NORM roms_std_b.nc $STDnameB
 $SUBSTITUTE $NORM roms_std_f.nc $STDnameF
 $SUBSTITUTE $NORM roms_std_c.nc $STDnameC
 $SUBSTITUTE $NORM roms_nrm_m.nc $NRMnameM
 $SUBSTITUTE $NORM roms_nrm_i.nc $NRMnameI
 $SUBSTITUTE $NORM roms_nrm_b.nc $NRMnameB
 $SUBSTITUTE $NORM roms_nrm_f.nc $NRMnameF
 $SUBSTITUTE $NORM roms_obs.nc   wc13_obs.nc
 $SUBSTITUTE $NORM roms_hss.nc   wc13_hss.nc
 $SUBSTITUTE $NORM roms_lcz.nc   wc13_lcz.nc
 $SUBSTITUTE $NORM roms_mod.nc   wc13_mod.nc
 $SUBSTITUTE $NORM roms_err.nc   wc13_err.nc
