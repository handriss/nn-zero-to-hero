# Pinned to a specific Python patch release for reproducibility.
# See: https://quay.io/repository/jupyter/pytorch-notebook?tab=tags
FROM quay.io/jupyter/pytorch-notebook:python-3.13.13

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        graphviz \
    && rm -rf /var/lib/apt/lists/*

USER ${NB_UID}

RUN pip install --no-cache-dir \
        graphviz \
        tiktoken \
        transformers \
        datasets \
        wandb
