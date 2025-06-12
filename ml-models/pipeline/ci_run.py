import sys

from ml_pipeline import preprocess, train, evaluate


def main() -> None:
    """Execute the ML pipeline sequentially for CI."""
    try:
        preprocess()
        train()
        evaluate()
    except Exception as exc:  # pragma: no cover - pipeline errors are critical
        print(f"Pipeline failed: {exc}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
    # TODO: integrate execution with GitHub Actions
