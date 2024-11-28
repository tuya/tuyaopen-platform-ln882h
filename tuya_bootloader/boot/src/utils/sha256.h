#ifndef SHA256_H_
#define SHA256_H_
#include <stdint.h>

typedef struct {
    uint8_t  buf[64];
    uint32_t hash[8];
    uint32_t bits[2];
    uint32_t len;
} sha256_context;

void sha256_init(sha256_context *ctx);

void sha256_hash(sha256_context *ctx, const void *data, int len);

void sha256_done(sha256_context *ctx, uint8_t *hash);

/**
* @brief hash data with sha256
* @param data data to be hash
* @param len data length
* @param hash hash value (need 32 bytes buffer)

* @return success return 0, failed return errno
*/
int sha256(const void *data, int len, uint8_t *hash);

#endif
