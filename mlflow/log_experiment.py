import mlflow

if __name__ == "__main__":
    # Start a new run
    mlflow.start_run(run_name="hello-devops-dummy")

    mlflow.log_param("learning_rate", 0.1)
    mlflow.log_param("model_type", "dummy-sklearn-like")

    mlflow.log_metric("accuracy", 0.85)
    mlflow.log_metric("loss", 0.2)

    mlflow.log_artifact("../../../README.md", artifact_path="docs")

    mlflow.end_run()

    print("Logged just experiment to MLflow.")