import pytest
from .local_model import predict_budget_advice


def test_predict_returns_string():
    result = predict_budget_advice("test")
    assert isinstance(result, str)

# TODO: expand with real prompts and validations
