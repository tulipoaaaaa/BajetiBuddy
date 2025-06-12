import argparse


def preprocess():
    print("Preprocessing data...")


def train():
    print("Training model...")


def evaluate():
    print("Evaluating model...")


def deploy():
    print("Deploying model...")


STAGES = {
    "preprocess": preprocess,
    "train": train,
    "evaluate": evaluate,
    "deploy": deploy,
}


def main() -> None:
    parser = argparse.ArgumentParser(description="BajetiBuddy ML pipeline")
    parser.add_argument("stage", choices=STAGES.keys(), help="Pipeline stage to run")
    args = parser.parse_args()
    STAGES[args.stage]()


if __name__ == "__main__":
    main()
