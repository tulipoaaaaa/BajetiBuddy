# ML Pipeline

This folder will contain scripts to orchestrate data preprocessing, model training, and inference packaging. When you modify or add new stages you can re-run the entire flow locally or in CI.

## Running the Pipeline

There are two equivalent entry points for executing the pipeline:

1. **Using Python** – run `python ci_run.py` from the repository root. This script will sequentially execute each stage defined in the pipeline modules.
2. **Using DVC** – run `dvc repro` if you have [DVC](https://dvc.org/) configured. The command reproduces all stages described in the `dvc.yaml` file, ensuring data dependencies are tracked.

Both approaches automate dataset preparation, model training and exporting of artifacts so the mobile and backend services use the latest model files.

## Versioning Strategy

The `versioning.py` helper script centralizes version numbers for datasets and models. Each stage reads the current version identifier from this file and writes outputs to versioned directories (for example `artifacts/v1/`). When you increment the version number, downstream stages automatically pick up the updated paths which helps keep experiments reproducible.

## Orchestration Alternatives

For production deployments you may prefer a dedicated orchestrator over simple scripts. Two common options are:

- [**Apache Airflow**](https://airflow.apache.org/) – a mature workflow scheduler for complex data pipelines and DAGs.
- [**Prefect**](https://docs.prefect.io/) – a lightweight workflow management system with a modern Python API.

Either tool can trigger the same pipeline stages defined here, giving you monitoring and scheduling capabilities out of the box.
