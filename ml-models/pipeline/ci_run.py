import sys

from ml_pipeline import prepare_data, train_model, evaluate_model


def main() -> None:
    """Execute the ML pipeline sequentially for CI."""
    try:
        prepare_data()
        train_model()
        metrics = evaluate_model()
    except Exception as exc:  # pragma: no cover - pipeline errors are critical
        print(f"Pipeline failed: {exc}", file=sys.stderr)
        sys.exit(1)

    print("\nEvaluation Metrics Summary:")
    for key, value in metrics.items():
        print(f"{key}: {value}")


if __name__ == "__main__":
    main()
    # TODO: integrate execution with GitHub Actions
