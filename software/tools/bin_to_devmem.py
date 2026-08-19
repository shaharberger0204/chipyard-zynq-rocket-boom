#!/usr/bin/env python3
"""Convert a flat little-endian RISC-V binary into 32-bit Linux devmem writes.

Example:
    python3 bin_to_devmem.py ../benchmark/bin/benchmark_fpga.bin \
        --base 0x40000000 > load_benchmark.sh
"""

import argparse
from pathlib import Path


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("binary", type=Path)
    parser.add_argument("--base", type=lambda x: int(x, 0), default=0x40000000)
    args = parser.parse_args()

    data = args.binary.read_bytes()
    if len(data) % 4:
        data += b"\x00" * (4 - len(data) % 4)

    print("#!/bin/sh")
    print("set -e")
    for offset in range(0, len(data), 4):
        word = int.from_bytes(data[offset:offset + 4], "little")
        print(f"devmem 0x{args.base + offset:08X} 32 0x{word:08X}")


if __name__ == "__main__":
    main()
