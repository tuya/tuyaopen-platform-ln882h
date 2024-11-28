#include <reent.h>
#include <string.h>
#include <stdarg.h>
#include <sys/errno.h>
#include <sys/time.h>
#include <sys/unistd.h>

#include "tuya_boot.h"
//#include "utils.h"
void *_malloc_r(struct _reent *ptr, size_t size);
void *_realloc_r(struct _reent *ptr, void *old, size_t newlen);
void *_calloc_r(struct _reent *ptr, size_t size, size_t len);
void _free_r(struct _reent *ptr, void *addr);
void abort(void);

int _execve_r(struct _reent *ptr, const char *name, char *const *argv, char *const *env)
{
    unused_param(name);
    unused_param(argv);
    unused_param(env);

    ptr->_errno = ENOTSUP;
    return -1;
}

int _fcntl_r(struct _reent *ptr, int fd, int cmd, int arg)
{
    unused_param(ptr);
    unused_param(fd);
    unused_param(cmd);
    unused_param(arg);

    return 0;
}

int _fork_r(struct _reent *ptr)
{
    ptr->_errno = ENOTSUP;

    return -1;
}

int _getpid_r(struct _reent *ptr)
{
    ptr->_errno = ENOTSUP;
    return 0;
}

int _isatty_r(struct _reent *ptr, int fd)
{
    if (fd >= 0 && fd < 3)
    {
        return 1;
    }

    ptr->_errno = ENOTSUP;
    return -1;
}

int _kill_r(struct _reent *ptr, int pid, int sig)
{
    unused_param(pid);
    unused_param(sig);

    ptr->_errno = ENOTSUP;
    return -1;
}

int _link_r(struct _reent *ptr, const char *old, const char *new)
{
    unused_param(old);
    unused_param(new);

    ptr->_errno = ENOTSUP;
    return -1;
}

_off_t _lseek_r(struct _reent *ptr, int fd, _off_t pos, int whence)
{
    unused_param(ptr);
    unused_param(fd);
    unused_param(pos);
    unused_param(whence);

    return 0;
}

int _mkdir_r(struct _reent *ptr, const char *name, int mode)
{
    unused_param(ptr);
    unused_param(name);
    unused_param(mode);

    return 0;
}

int _open_r(struct _reent *ptr, const char *file, int flags, int mode)
{
    unused_param(ptr);
    unused_param(file);
    unused_param(flags);
    unused_param(mode);

    return 0;
}

int _close_r(struct _reent *ptr, int fd)
{
    unused_param(ptr);
    unused_param(fd);

    return 0;
}

_ssize_t _read_r(struct _reent *ptr, int fd, void *buf, size_t nbytes)
{
    unused_param(ptr);
    unused_param(fd);
    unused_param(buf);
    unused_param(nbytes);

    return 0;
}

_ssize_t _write_r(struct _reent *ptr, int fd, const void *buf, size_t nbytes)
{
    unused_param(ptr);
    unused_param(fd);
    unused_param(buf);

    // log_stdio_write((char *)buf, nbytes);
    //log_raw_data_flush(buf, nbytes);
    return nbytes;
}

int _fstat_r(struct _reent *ptr, int fd, struct stat *pstat)
{
    unused_param(fd);
    unused_param(pstat);

    ptr->_errno = ENOTSUP;
    return -1;
}

int _rename_r(struct _reent *ptr, const char *old, const char *new)
{
    unused_param(old);
    unused_param(new);

    ptr->_errno = ENOTSUP;
    return 0;
}

void *_sbrk_r(struct _reent *ptr, ptrdiff_t incr)
{
    unused_param(incr);

    ptr->_errno = ENOTSUP;
    return NULL;
}

int _stat_r(struct _reent *ptr, const char *file, struct stat *pstat)
{
    unused_param(ptr);
    unused_param(file);
    unused_param(pstat);

    return 0;
}

int _unlink_r(struct _reent *ptr, const char *file)
{
    unused_param(ptr);
    unused_param(file);

    return 0;
}

int _wait_r(struct _reent *ptr, int *status)
{
    unused_param(status);

    ptr->_errno = ENOTSUP;
    return -1;
}

int _gettimeofday_r(struct _reent *ptr, struct timeval *tv, void *__tzp)
{
    unused_param(ptr);
    unused_param(tv);
    unused_param(__tzp);

    return 0;
}

void *_malloc_r(struct _reent *ptr, size_t size)
{
    unused_param(ptr);

    void *mem;
    mem = (void *)pvPortMalloc(size);

    return mem;
}

void *_realloc_r(struct _reent *ptr, void *old, size_t newlen)
{
    void *res = NULL;
    if (newlen == 0) {
        vPortFree(old);
        return NULL;
    }

    res = (void *)pvPortMalloc(newlen);

    if (old == NULL) {
        return res;
    }

    if (res != NULL) {
        memcpy(res, old, newlen);
        vPortFree(old);
    } else {
        ptr->_errno = ENOMEM;
    }

    return res;
}

void *_calloc_r(struct _reent *ptr, size_t size, size_t len)
{
    void *res = NULL;
    res = (void *)pvPortMalloc(size *len);
    if (res == NULL) {
        ptr->_errno = ENOMEM;
    } else {
        memset(res, 0x0, size * len);
    }

    return res;
}

void _free_r(struct _reent *ptr, void *addr)
{
    unused_param(ptr);

    if (NULL != addr)
    {
        vPortFree(addr);
    }
}

void _exit(int status)
{
    unused_param(status);

    // thread:%s exit with status %d
    while (1);
}

void abort(void)
{
    // abort at thread:%s
    // re-schedule
    while (1);
}
