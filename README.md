# nn-zero-to-hero

My work through Andrej Karpathy's [Neural Networks: Zero to Hero](https://karpathy.ai/zero-to-hero.html).

Docker-based so the env still builds in a year and behaves the same on the laptop and a cloud GPU box.

## Quick start

```sh
make help          # list every chore
make build         # first time only
make up && make url
```

Open the printed URL → JupyterLab opens with the repo mounted.

## Layout

- `NN-video/` — one folder per video, notebooks live there.
- `confusion-log.md` — running list of things that didn't click. Add mid-video, resolve on Sundays.

## Notes to future me

- Inside the container, this repo is at `/home/jovyan/work` (NOT `/home/jovyan` — that path would shadow the image's defaults). All edits are live; no rebuild needed for notebook changes.
- The image is CPU-only. The base also ships a CUDA-tagged variant (`cuda12-python-3.13.13`); swap the `FROM` and run on a GPU box for the GPT-2 reproduction in video 8. Don't try it on the laptop.
- Override the token: `JUPYTER_TOKEN=something make up`. Default is `changeme`.
- Notebook outputs are committed by default. If they get noisy, consider `nbstripout` later — not worth it yet.
- Big artifacts (`*.pt`, datasets, `wandb/`) are gitignored. Don't fight it.
