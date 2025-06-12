import json
import os
import tempfile

from .versioning import save_model_version


def test_save_model_version_creates_metadata():
    with tempfile.TemporaryDirectory() as tmpdir:
        version = save_model_version(tmpdir, {"accuracy": 0.95})
        meta_path = os.path.join(tmpdir, "metadata.json")
        assert os.path.exists(meta_path)
        with open(meta_path, "r", encoding="utf-8") as f:
            data = json.load(f)
        assert data["version"] == version
        assert data["accuracy"] == 0.95
