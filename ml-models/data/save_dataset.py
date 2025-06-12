"""Utility functions for saving training datasets."""
from __future__ import annotations

import json
from pathlib import Path
from typing import List, Dict


def save_jsonl(data: List[Dict], path: str) -> None:
    """Write list of dictionaries to a JSONL file."""
    p = Path(path)
    with p.open("w", encoding="utf-8") as f:
        for item in data:
            f.write(json.dumps(item) + "\n")
    # TODO: handle append or overwrite options
