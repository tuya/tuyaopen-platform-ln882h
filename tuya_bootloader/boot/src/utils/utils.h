/****************************************************************************
 * @file utils.h
 * @brief header file of utils
 * @version <0.0.1>
 * @date 2022-06-17
 *
 * @copyright Copyright(C) 2021-2022 Tuya Inc. All Rights Reserved.
 ****************************************************************************/

#ifndef __UTILS_H__
#define __UTILS_H__


/****************************************************************************
 * Included Files
 ****************************************************************************/
#include <stdint.h>
#include <stdarg.h>
#include <stddef.h>

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/


/****************************************************************************
 * Public Type Declarations
 ****************************************************************************/


/****************************************************************************
 * Public Data
 ****************************************************************************/

#ifdef __cplusplus
extern "C" {
#endif

/****************************************************************************
 * Public Function Prototypes
 ****************************************************************************/

int32_t _vsnprintf(char *buf, size_t size, const char *fmt, va_list args);
int bl_memcmp(const void *s1, const void *s2, size_t n);

// for clean warning
//void *_malloc_r(struct _reent *ptr, size_t size);
//void *_realloc_r(struct _reent *ptr, void *old, size_t newlen);
//void *_calloc_r(struct _reent *ptr, size_t size, size_t len);
//void _free_r(struct _reent *ptr, void *addr);
//void abort(void);


#ifdef __cplusplus
}
#endif

#endif /* !__UTILS_H__ */
