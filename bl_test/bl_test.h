/*
** git $Id$
*******************************************************************************
** Copyright (c) 2002-2025 The ROMS Group                                    **
**   Licensed under a MIT/X style license                                    **
**   See License_ROMS.md                                                     **
*******************************************************************************
**
** Boundary Layers Test.
**
** Application flag:   BL_TEST
** Input scripts:      roms_bl_test.in
**                     stations_bl_test.in
*/

#define UV_ADV
#define UV_SADVECTION
#define UV_COR
#define UV_VIS2
#define MIX_S_UV
#define DJ_GRADPS
#define SPLINES_VDIFF
#define SPLINES_VVISC
#define SOLAR_SOURCE
#define NONLIN_EOS
#define SALINITY
#define STATIONS
#define SOLVE3D

#ifdef MY25_MIXING
# define N2S2_HORAVG
# define KANTHA_CLAYSON
#endif

#ifdef LMD_MIXING
# define LMD_RIMIX
# define LMD_CONVEC
# define LMD_SKPP
# define LMD_BKPP
# define LMD_NONLOCAL
# define LMD_DDMIX
# define RI_SPLINES
#endif

#define BULK_FLUXES
#ifdef BULK_FLUXES
# define LONGWAVE
# define ANA_CLOUD
# define ANA_HUMIDITY
# define ANA_PAIR
# define ANA_TAIR
# define ANA_RAIN
# define ANA_WINDS
#else
# define ANA_SMFLUX
# define ANA_STFLUX
#endif

#ifdef SG_BBL
# define SG_CALC_UB
# define SG_CALC_ZNOT
# define ANA_SEDIMENT
# define ANA_WWAVE
#else
# define UV_QDRAG
#endif

#define ANA_GRID
#define ANA_INITIAL
#define ALBEDO
#define ANA_SRFLUX
#define ANA_SSFLUX
#define ANA_BSFLUX
#define ANA_BTFLUX
