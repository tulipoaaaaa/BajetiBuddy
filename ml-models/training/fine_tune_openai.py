import csv
import json
from pathlib import Path
import openai

DATA_CSV = Path('data/kenyan_financial_patterns.csv')
OUTPUT_JSONL = Path('data/kenyan_financial_patterns.jsonl')


def build_fine_tuning_dataset():
    """Load CSV and convert rows to OpenAI fine-tuning format."""
    dataset = []
    with DATA_CSV.open(newline='', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            dataset.append({
                "messages": [
                    {"role": "user", "content": row['query']},
                    {"role": "assistant", "content": row['response']}
                ]
            })
    return dataset


def export_jsonl(data):
    """Write list of dictionaries to a JSONL file."""
    with OUTPUT_JSONL.open('w', encoding='utf-8') as f:
        for item in data:
            f.write(json.dumps(item) + "\n")


if __name__ == '__main__':
    dataset = build_fine_tuning_dataset()
    export_jsonl(dataset)
    # TODO: call openai.FineTune.create(...) with OUTPUT_JSONL
