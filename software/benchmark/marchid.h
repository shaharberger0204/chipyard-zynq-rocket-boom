#ifndef MARCHID_H
#define MARCHID_H

#include <stdint.h>

/*
 * marchid values observed in the final project runs.
 * This small helper keeps benchmark.c self-contained in the archive.
 */
static inline const char *get_march(uint32_t marchid)
{
    switch (marchid) {
    case 1u:
        return "rocket";
    case 2u:
        return "sonicboom";
    default:
        return "unknown";
    }
}

#endif
