
#include <stdlib.h>
#include <stdint.h>
#include <xz_config.h>
#include "heap.h"

// TODO
void *ty_adapt_malloc(uint32_t size)
{
    return (void *) pvPortMalloc(size);
}

void ty_adapt_free(void *ptr)
{
    vPortFree(ptr);
}
