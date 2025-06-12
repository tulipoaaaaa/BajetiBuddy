from __future__ import annotations

import json
from datetime import datetime
from pathlib import Path
from typing import Dict


def save_model_version(model_path: str, metadata: Dict) -> str:
    """Save metadata for a trained model and return its version string.

    A version tag is generated using the current UTC timestamp in the
    format ``vYYYYMMDDHHMMSS``. The metadata is stored alongside the
    version tag in ``<model_path>/metadata.json``.
    """
    path = Path(model_path)
    path.mkdir(parents=True, exist_ok=True)

    version = datetime.utcnow().strftime("v%Y%m%d%H%M%S")

    meta = {"version": version}
    meta.update(metadata)

    with (path / "metadata.json").open("w", encoding="utf-8") as f:
        json.dump(meta, f, indent=2, ensure_ascii=False)

    return version
