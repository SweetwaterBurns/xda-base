/* This file is part of the CodeSourcery C Library (CSLIBC).

   Copyright (c) 2007 - 2009 CodeSourcery, Inc.
 * Version:Sourcery G++ Lite 2009q3-68
 * BugURL:https://support.codesourcery.com/GNUToolchain/

   THIS FILE CONTAINS PROPRIETARY, CONFIDENTIAL, AND TRADE SECRET
   INFORMATION OF CODESOURCERY AND/OR ITS LICENSORS.

   You may not use, modify or distribute this file without the express
   written permission of CodeSourcery or its authorized
   distributor. Please consult your license agreement for the
   applicable terms and conditions.  */

#ifndef CSL_CS3_H
#define CSL_CS3_H

#include <stddef.h>

#if __cplusplus
extern "C" {
#endif

typedef unsigned char __cs3_byte_align8 __attribute ((aligned (8)));

struct __cs3_region
{
  unsigned flags;       /* Flags for this region.  None defined yet.  */
  __cs3_byte_align8 *init;  /* Initial contents of this region.  */
  __cs3_byte_align8 *data;  /* Start address of region.  */
  size_t init_size;     /* Size of initial data.  */
  size_t zero_size;     /* Additional size to be zeroed.  */
};

/* number of elements in __cs3_regions.  This is weak, so the
   compiler does not presume it is non-zero.  */
extern const char __cs3_region_num __attribute__((weak));
#define __cs3_region_num ((size_t)&__cs3_region_num)

extern const struct __cs3_region __cs3_regions[];

extern void __cs3_start_c (void) __attribute ((noreturn));

/* regions, some may not be present on particular boards or profiles */

/* We use weak on objects that might be at address zero.
   The compiler is at liberty to presume that no non-weak
   object resides at address zero (because that's
   indistinguishable from the NULL pointer on the systems
   we care about).  */

/* itcm region */
extern unsigned char __cs3_region_start_itcm[] __attribute__((weak,aligned(8)));
extern unsigned char __cs3_region_size_itcm[] __attribute__((aligned(8)));
/* __cs3_region_end_itcm is deprecated */
extern unsigned char __cs3_region_end_itcm[] __attribute__((weak,aligned(8)));
extern const unsigned char __cs3_region_init_itcm[] __attribute__((weak,aligned(8)));
extern const char __cs3_region_init_size_itcm __attribute__((weak,aligned(8)));
#define __cs3_region_init_size_itcm ((size_t)&__cs3_region_init_size_itcm)
extern const char __cs3_region_zero_size_itcm __attribute__((weak,aligned(8)));
#define __cs3_region_zero_size_itcm ((size_t)&__cs3_region_zero_size_itcm)

/* ram region */
extern unsigned char __cs3_region_start_ram[] __attribute__((weak,aligned(8)));
extern unsigned char __cs3_region_size_ram[] __attribute__((aligned(8)));
/* __cs3_region_end_ram is deprecated */
extern unsigned char __cs3_region_end_ram[] __attribute__((weak,aligned(8)));
extern const unsigned char __cs3_region_init_ram[] __attribute__((weak,aligned(8)));
extern const char __cs3_region_init_size_ram __attribute__((weak,aligned(8)));
#define __cs3_region_init_size_ram ((size_t)&__cs3_region_init_size_ram)
extern const char __cs3_region_zero_size_ram __attribute__((weak,aligned(8)));
#define __cs3_region_zero_size_ram ((size_t)&__cs3_region_zero_size_ram)

/* rom region */
extern unsigned char __cs3_region_start_rom[] __attribute__((weak,aligned(8)));
extern unsigned char __cs3_region_size_rom[] __attribute__((aligned(8)));
/* __cs3_region_end_rom is deprecated */
extern unsigned char __cs3_region_end_rom[] __attribute__((weak,aligned(8)));
extern const unsigned char __cs3_region_init_rom[] __attribute__((weak,aligned(8)));
extern const char __cs3_region_init_size_rom __attribute__((weak,aligned(8)));
#define __cs3_region_init_size_rom ((size_t)&__cs3_region_init_size_rom)
extern const char __cs3_region_zero_size_rom __attribute__((weak,aligned(8)));
#define __cs3_region_zero_size_rom ((size_t)&__cs3_region_zero_size_rom)

#if __cplusplus
}
#endif
#endif /* CSL_CS3_H */
