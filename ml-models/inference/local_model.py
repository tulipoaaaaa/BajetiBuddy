"""Local OpenAI model inference utilities."""
from __future__ import annotations

import os
import openai

# Replace with your fine-tuned model ID or name
MODEL_NAME = os.getenv("OPENAI_FINE_TUNED_MODEL", "ft-bajeti-buddy")


def predict_budget_advice(prompt: str) -> str:
    """Return budgeting advice from the fine-tuned model."""
    response = openai.ChatCompletion.create(
        model=MODEL_NAME,
        messages=[{"role": "user", "content": prompt}],
    )
    # TODO: implement caching and proper error handling
    return response["choices"][0]["message"]["content"].strip()
