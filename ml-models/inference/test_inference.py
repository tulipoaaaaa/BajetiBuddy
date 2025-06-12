from unittest.mock import patch

import pytest

from .local_model import predict_budget_advice


def test_predict_returns_string():
    with patch("openai.ChatCompletion.create") as mock_create:
        mock_create.return_value = {"choices": [{"message": {"content": "ok"}}]}
        result = predict_budget_advice("test")
        assert isinstance(result, str)

# TODO: expand with real prompts and validations
