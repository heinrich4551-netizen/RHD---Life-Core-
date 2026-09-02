#!/usr/bin/env python3
"""Minimal Arma 3 PBO packer for uncompressed mission PBOs.

The packer writes standard PBO file headers and stores files verbatim.
It is intentionally small so the CI server package does not depend on
platform-specific PBO tooling.
"""
from __future__ import annotations

import argparse
import struct
from pathlib import Path

HEADER_STRUCT = struct.Struct("<IIIII")


def write_entry_header(handle, name: str, size: int) -> None:
    handle.write(name.encode("utf-8") + b"\x00")
    # packingMethod, originalSize, reserved, timestamp, dataSize
    handle.write(HEADER_STRUCT.pack(0, size, 0, 0, size))


def pack_directory(source: Path, destination: Path) -> None:
    files = sorted(p for p in source.rglob("*") if p.is_file())
    if not files:
        raise SystemExit(f"No files found under {source}")

    destination.parent.mkdir(parents=True, exist_ok=True)
    with destination.open("wb") as handle:
        for path in files:
            relative = path.relative_to(source).as_posix()
            data = path.read_bytes()
            write_entry_header(handle, relative, len(data))
        # End-of-header entry.
        handle.write(b"\x00")
        handle.write(b"\x00" * HEADER_STRUCT.size)
        for path in files:
            handle.write(path.read_bytes())


def main() -> None:
    parser = argparse.ArgumentParser(description="Pack a directory into an Arma 3 PBO")
    parser.add_argument("source", type=Path)
    parser.add_argument("destination", type=Path)
    args = parser.parse_args()

    source = args.source.resolve()
    destination = args.destination.resolve()
    if not source.is_dir():
        raise SystemExit(f"Source is not a directory: {source}")
    if destination == source or destination.is_relative_to(source):
        raise SystemExit("Destination must not be inside the source directory")

    pack_directory(source, destination)
    print(f"Packed {source} -> {destination}")


if __name__ == "__main__":
    main()
