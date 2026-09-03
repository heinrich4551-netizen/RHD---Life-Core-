#!/usr/bin/env python3
from __future__ import annotations

import argparse
import os
import struct
from pathlib import Path


def validate_source(source: Path) -> None:
    """Reject known-bad RHD LifeCore UI inheritance before a PBO is built."""
    if source.name != "rhd_lifecore":
        return

    config = source / "config.cpp"
    if not config.is_file():
        raise SystemExit(f"RHD LifeCore source is missing {config}")

    text = config.read_text(encoding="utf-8")
    required = [
        "class RHD_RscText",
        "class RHD_RscStructuredText",
        "class RHD_RscListbox",
        "class RHD_RscButton",
        "class RHD_RscEdit",
        "class RHD_RscCombo",
    ]
    missing = [token for token in required if token not in text]
    if missing:
        raise SystemExit(
            "RHD LifeCore config is missing self-contained UI base classes: "
            + ", ".join(missing)
        )

    forbidden = [
        ": RscStructuredText",
        ": RscText",
        ": RscListbox",
        ": RscButton",
        ": RscEdit",
        ": RscCombo",
    ]
    found = [token for token in forbidden if token in text]
    if found:
        raise SystemExit(
            "RHD LifeCore config contains global Rsc* inheritance and would "
            "produce an undefined-base-class error: " + ", ".join(found)
        )


def write_entry(handle, name: str, size: int) -> None:
    """Write a standard uncompressed PBO directory entry."""
    handle.write(name.replace(os.sep, "/").encode("utf-8") + b"\x00")
    # packing method, original size, reserved, timestamp, data size
    handle.write(struct.pack("<IIIII", 0, size, 0, 0, size))


def pack_directory(source: Path, output: Path) -> None:
    if not source.is_dir():
        raise SystemExit(f"Source directory does not exist: {source}")

    validate_source(source)
    files = sorted(p for p in source.rglob("*") if p.is_file())
    output.parent.mkdir(parents=True, exist_ok=True)

    with output.open("wb") as handle:
        for path in files:
            write_entry(handle, path.relative_to(source).as_posix(), path.stat().st_size)

        # PBO directory terminator: empty filename followed by the five
        # uint32 header fields. Omitting these 20 bytes makes the first bytes
        # of file data get interpreted as a directory entry by Arma 3.
        handle.write(b"\x00" + b"\x00" * 20)

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
