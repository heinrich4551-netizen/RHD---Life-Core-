#!/usr/bin/env python3
from __future__ import annotations

import argparse
import os
import struct
from pathlib import Path


def write_entry(handle, name: str, size: int) -> None:
    handle.write(name.replace(os.sep, "/").encode("utf-8") + b"\x00")
    handle.write(struct.pack("<IIIII", 0, size, 0, 0, size))


def pack_directory(source: Path, output: Path) -> None:
    if not source.is_dir():
        raise SystemExit(f"Source directory does not exist: {source}")
    files = sorted(p for p in source.rglob("*") if p.is_file())
    output.parent.mkdir(parents=True, exist_ok=True)
    with output.open("wb") as handle:
        for path in files:
            write_entry(handle, path.relative_to(source).as_posix(), path.stat().st_size)
        handle.write(b"\x00")
        for path in files:
            handle.write(path.read_bytes())


def main() -> None:
    parser = argparse.ArgumentParser(description="Write an uncompressed Arma PBO from a directory")
    parser.add_argument("source", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    pack_directory(args.source, args.output)


if __name__ == "__main__":
    main()
