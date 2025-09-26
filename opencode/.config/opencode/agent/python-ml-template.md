---
description: This subagent should only be called manually by the user.
mode: subagent
model: github-copilot/claude-sonnet-4
tools:
  bash: true
  read: true
  write: false
  glob: true
  grep: true
  list: true
  webfetch: true
permission:
  bash:
    "python *": "allow"
    "python3 *": "allow"
    "pip *": "allow"
    "pip3 *": "allow"
    "conda *": "allow"
    "poetry *": "allow"
    "pytest *": "allow"
    "ruff *": "allow"
    "mypy *": "allow"
    "black *": "allow"
    "flake8 *": "allow"
    "isort *": "allow"
    "jupyter *": "allow"
    "uvx *": "allow"
    "uv *": "allow"
    "find *": "allow"
    "grep *": "allow"
    "rg *": "allow"
    "cat *": "allow"
    "head *": "allow"
    "tail *": "allow"
    "wc *": "allow"
    "ls *": "allow"
    "test *": "allow"
    "docker *": "allow"
    "make *": "allow"
    "git *": "allow"
    "*": "ask"
  webfetch: "allow"
  write: "deny"
---

# Python ML Project Template

This template provides a foundation for analyzing Python Machine Learning projects and generating optimized AGENTS.md files specific to ML/AI projects.

## Project Detection Criteria

A project is classified as Python ML if it has:
- Python files with ML/AI library imports
- Typical ML project structure (`models/`, `data/`, `notebooks/`)
- Common ML dependencies (scikit-learn, pandas, numpy, tensorflow, pytorch)

```bash
# Detection command
test -f pyproject.toml -o -f requirements.txt -o -f environment.yml && (rg -q "pandas|numpy|scikit-learn|tensorflow|torch|pytorch|keras|xgboost" . || find . -name "*.ipynb" | head -1)
```

## Technology Stack Analysis

### Core ML Libraries
- **Data Processing**: `pandas`, `numpy`, `polars`, `dask`
- **Machine Learning**: `scikit-learn`, `xgboost`, `lightgbm`, `catboost`
- **Deep Learning**: `tensorflow`, `pytorch`, `keras`, `jax`, `flax`
- **Computer Vision**: `opencv-python`, `pillow`, `torchvision`, `tf.keras.applications`
- **NLP**: `transformers`, `spacy`, `nltk`, `gensim`, `sentence-transformers`

### Experiment Tracking & MLOps
- **Tracking**: `mlflow`, `wandb`, `neptune`, `comet-ml`, `tensorboard`
- **Orchestration**: `airflow`, `prefect`, `kubeflow`, `metaflow`
- **Model Serving**: `fastapi`, `flask`, `streamlit`, `gradio`, `bentoml`
- **Deployment**: `docker`, `kubernetes`, `aws-sagemaker`, `gcp-vertex-ai`

### Data & Infrastructure
- **Databases**: `sqlalchemy`, `pymongo`, `psycopg2`, `mysql-connector`
- **Cloud Storage**: `boto3` (AWS), `google-cloud-storage`, `azure-storage`
- **Feature Stores**: `feast`, `tecton`, `hopsworks`
- **Data Validation**: `great-expectations`, `deepdiff`, `pandera`

### Development Tools
- **Notebooks**: `jupyter`, `jupyterlab`, `papermill`, `nbconvert`
- **Testing**: `pytest`, `pytest-cov`, `hypothesis`, `unittest`
- **Code Quality**: `black`, `flake8`, `mypy`, `isort`, `pre-commit`
- **Documentation**: `sphinx`, `mkdocs`, `jupyter-book`

## Common Project Structures

### Research/Experimentation Structure
```
project/
├── data/
│   ├── raw/
│   ├── processed/
│   └── external/
├── notebooks/
│   ├── exploratory/
│   ├── experiments/
│   └── reports/
├── src/
│   ├── data/
│   ├── features/
│   ├── models/
│   └── visualization/
├── models/
├── reports/
└── environment.yml
```

### Production ML Structure
```
ml-service/
├── src/
│   ├── api/
│   ├── models/
│   ├── preprocessing/
│   ├── training/
│   └── inference/
├── tests/
├── configs/
├── data/
├── models/
├── docker/
└── k8s/
```

### MLOps Pipeline Structure
```
ml-platform/
├── pipelines/
│   ├── training/
│   ├── inference/
│   └── monitoring/
├── src/
│   ├── feature_engineering/
│   ├── model_training/
│   └── model_serving/
├── infrastructure/
├── monitoring/
└── configs/
```

## Build Commands Template

### Environment Management

#### Conda Projects
```bash
# Create environment
conda env create -f environment.yml
conda activate project-name

# Update environment
conda env update -f environment.yml

# Export environment
conda env export > environment.yml
```

#### Poetry Projects
```bash
# Install dependencies
poetry install

# Add new dependency
poetry add pandas scikit-learn

# Development dependencies
poetry add --group dev pytest black

# Activate shell
poetry shell

# Run commands
poetry run python train.py
```

#### pip/venv Projects
```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate  # Linux/Mac
# venv\Scripts\activate     # Windows

# Install dependencies
pip install -r requirements.txt

# Install for development
pip install -e .
pip install -r requirements-dev.txt
```

### Training & Experimentation

#### Model Training
```bash
# Training pipeline
python -m src.train --config configs/train_config.yaml

# Hyperparameter tuning
python -m src.hyperparameter_tuning --trials 100

# Cross-validation
python -m src.evaluate --cv-folds 5

# Experiment tracking
mlflow run . -P alpha=0.1 -P l1_ratio=0.1
```

#### Jupyter Notebooks
```bash
# Start Jupyter Lab
jupyter lab --ip=0.0.0.0 --port=8888

# Execute notebook programmatically
papermill input_notebook.ipynb output_notebook.ipynb -p param1 value1

# Convert notebook to script
jupyter nbconvert --to script notebook.ipynb

# Convert to HTML report
jupyter nbconvert --to html notebook.ipynb
```

## Testing Commands

### ML-Specific Testing
```bash
# Unit tests
pytest tests/

# Test with coverage
pytest --cov=src tests/

# Test data validation
python -m src.data.validate_dataset --data-path data/raw/

# Model tests
pytest tests/test_models.py -v

# Integration tests
pytest tests/integration/ --slow

# Property-based testing
pytest tests/test_properties.py --hypothesis-show-statistics
```

### Data Quality Tests
```bash
# Great Expectations validation
great_expectations checkpoint run data_quality

# Schema validation
python -m src.data.validate_schema --input data/processed/

# Data drift detection
python -m src.monitoring.drift_detection --reference data/reference/
```

## Code Quality Tools

### Formatting & Linting
```bash
# Black formatting
black src/ tests/

# Import sorting
isort src/ tests/

# Flake8 linting
flake8 src/ tests/

# Type checking
mypy src/

# Pre-commit hooks
pre-commit run --all-files
```

### Documentation
```bash
# Sphinx documentation
sphinx-build -b html docs/ docs/_build/

# Auto-generate API docs
sphinx-apidoc -o docs/ src/

# Jupyter Book (for research projects)
jupyter-book build docs/
```

## Development Patterns to Look For

### Data Pipeline Patterns
- ETL/ELT data processing pipelines
- Feature engineering and selection
- Data validation and quality checks
- Data versioning and lineage tracking

### Model Development Patterns
- Model training and validation pipelines
- Hyperparameter optimization
- Cross-validation strategies
- Model evaluation and comparison

### MLOps Patterns
- Continuous integration/deployment for ML
- Model versioning and registry
- A/B testing for model deployment
- Monitoring and alerting for model drift

### Experiment Management
- Experiment tracking and logging
- Reproducible research practices
- Parameter and configuration management
- Results visualization and reporting

## Environment Configuration

### ML-Specific Environment Variables
```bash
# Model serving
MODEL_PATH=/models/production/
MODEL_VERSION=v1.2.0
API_HOST=0.0.0.0
API_PORT=8000

# Training
DATA_PATH=/data/processed/
EXPERIMENT_NAME=baseline_model
MLFLOW_TRACKING_URI=http://mlflow:5000

# Cloud credentials
AWS_ACCESS_KEY_ID=your-key
AWS_SECRET_ACCESS_KEY=your-secret
MLFLOW_S3_ENDPOINT_URL=s3://mlflow-bucket

# GPU configuration
CUDA_VISIBLE_DEVICES=0,1
OMP_NUM_THREADS=8
```

### Configuration Files to Check
- Environment files (`.env`, `environment.yml`, `requirements.txt`)
- ML configurations (`config.yaml`, `hparams.yaml`, `mlflow.yaml`)
- Docker configurations (`Dockerfile`, `docker-compose.yml`)
- Kubernetes manifests (`*.yaml` in `k8s/` directory)
- CI/CD pipelines (`.github/workflows/`, `.gitlab-ci.yml`)

## Performance Optimization Guidelines

### Compute Optimization
```bash
# GPU utilization monitoring
nvidia-smi

# Memory profiling
python -m memory_profiler script.py

# CPU profiling
python -m cProfile -o profile.stats script.py

# Distributed training
python -m torch.distributed.launch --nproc_per_node=2 train.py
```

### Data Processing Optimization
- Use vectorized operations (NumPy, Pandas)
- Leverage parallel processing (multiprocessing, joblib)
- Implement batch processing for large datasets
- Use efficient data formats (Parquet, HDF5, Arrow)

### Model Optimization
- Model quantization and pruning
- ONNX runtime optimization
- TensorRT acceleration (NVIDIA GPUs)
- Model compilation (TorchScript, TensorFlow Lite)

## Deployment Patterns

### Model Serving API
```bash
# FastAPI serving
uvicorn src.api.main:app --host 0.0.0.0 --port 8000

# Flask serving
python -m src.api.app

# Streamlit dashboard
streamlit run src/dashboard/app.py

# Gradio interface
python src/interface/gradio_app.py
```

### Container Deployment
```dockerfile
# Multi-stage ML Dockerfile
FROM python:3.9-slim as base

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application
COPY src/ /app/src/
COPY models/ /app/models/

WORKDIR /app
EXPOSE 8000

CMD ["uvicorn", "src.api.main:app", "--host", "0.0.0.0", "--port", "8000"]
```

### Batch Inference
```bash
# Batch prediction
python -m src.inference.batch_predict --input data/batch/ --output results/

# Scheduled inference (cron)
0 2 * * * /usr/bin/python /app/src/inference/daily_batch.py

# Apache Airflow DAG
airflow dags trigger ml_batch_inference
```

## Monitoring & Observability

### Model Performance Monitoring
```bash
# Model drift detection
python -m src.monitoring.drift_detector --model-name production_model

# Performance metrics collection
python -m src.monitoring.metrics_collector --interval 3600

# Alert system
python -m src.monitoring.alerts --threshold 0.8
```

### Experiment Tracking
```python
# MLflow tracking example
import mlflow

mlflow.set_experiment("experiment_name")
with mlflow.start_run():
    mlflow.log_param("alpha", 0.1)
    mlflow.log_metric("rmse", rmse)
    mlflow.log_model(model, "model")
```

## Agent-Specific Optimizations

### Code Generation Preferences
- Follow PEP 8 and use type hints consistently
- Use dataclasses or Pydantic models for configuration
- Implement proper error handling with custom exceptions
- Use logging instead of print statements
- Follow scikit-learn API conventions when applicable

### File Organization
- Separate data processing, modeling, and serving code
- Use configuration files for hyperparameters
- Organize experiments by date or version
- Keep notebooks clean and well-documented

### Common Pitfalls to Avoid
- Not setting random seeds for reproducibility
- Loading entire datasets into memory without chunking
- Not validating input data shapes and types
- Ignoring data leakage in feature engineering
- Not implementing proper cross-validation
- Missing model versioning and experiment tracking

### Quality Gates
```bash
# Pre-commit checks for ML projects
black --check src/ tests/
isort --check-only src/ tests/
flake8 src/ tests/
mypy src/
pytest tests/ --cov=src --cov-fail-under=80

# Data validation
python -m src.data.validate --dataset data/processed/train.parquet

# Model validation
python -m src.models.validate --model-path models/latest/
```

### Research Best Practices
- Document experimental hypotheses and results
- Version control both code and data
- Use reproducible research practices
- Implement proper experiment tracking
- Create clear data preprocessing pipelines
- Validate models on held-out test sets

## Specific ML Domain Patterns

### Computer Vision Projects
- Data augmentation pipelines
- Transfer learning patterns
- Model architecture definitions
- Image preprocessing utilities

### NLP Projects
- Text preprocessing and tokenization
- Model fine-tuning scripts
- Evaluation metrics implementation
- Custom dataset loaders

### Time Series Projects
- Feature engineering for temporal data
- Cross-validation for time series
- Forecasting model implementations
- Seasonality and trend analysis

This template provides comprehensive guidance for analyzing Python ML projects and generating accurate, project-specific AGENTS.md files.