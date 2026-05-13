# Prototype 7 — Rebert web UI (Flask)

**Repository:** https://github.com/sarahvolynsky/hcde563-recommender-prototype-7  
**Student:** Sarah Volynsky

Imports use **`rebert._prototype_7_.web.*`**, so **`_prototype_7_`** must sit **inside** the same **`rebert`** directory as **`classes`**. If you use the standalone Git repo, **symlink** **`rebert/_prototype_7_`** from the clone into **`$PYTHONPATH/rebert/_prototype_7_`** (see the **root `README.md`** in the repository).

---

## Layout

- **`recommender_7.0.py`** — Starts the Flask dev server (`flask --app web/wsgi …`) and optionally opens a browser.
- **`web/`** — Flask app (`wsgi.py`, templates, static assets, tmp/data JSON).

---

## Dependencies

Use a virtual environment **in this folder**:

```bash
cd .../rebert/_prototype_7_    # your symlink or copy under course rebert/
python3 -m venv .venv
.venv/bin/pip install flask requests beautifulsoup4
```

---

## API keys

The server **`web/setup.py`** expects **KeyManager** entries for:

- **`api.openai.com`**
- **`api.themoviedb.org`**

(TMDB is used for synopses/meta during startup collection.)

---

## How to run

Ensure **`source ~/.zshenv`** (or equivalent) sets **`PYTHONPATH`** to the folder that contains **`rebert`** **with** **`classes`** **and** **`_prototype_7_`**.

```bash
source ~/.zshenv
chmod +x run.sh    # once
./run.sh
```

Useful flags (passed through to **`recommender_7.0.py`**):

- **`-mockup`** — Static UI smoke test (no LLM/TMDB pipeline).
- **`-port 5000`** — Port (default 5000).
- **`-delay 5`** — Seconds before opening the browser (default 5).

Examples:

```bash
./run.sh -mockup -delay 2
./run.sh -port 5001
```

Manual equivalent:

```bash
source ~/.zshenv
.venv/bin/python3 recommender_7.0.py
```

Then open **http://127.0.0.1:5000/** if the browser does not open automatically.

From the **cloned repository root**, you can run **`../run.sh`** (parent) or the repository’s top-level **`run.sh`**, which **`cd`**s into **`rebert/_prototype_7_`**.

---

## Notes

- First-time startup may **collect release data** (network + scraping + TMDB); if no movies match the configured window, startup logs **Found no 'recent' movie openings** and exits — adjust **`web/config.py`** (`REBERT_WINDOW_*`) if needed.
- Cached daily data is written under **`web/tmp/`** (`rebert-p7.0_data_YYYYMMDD.json`).
- Do not commit **`.venv`** or secrets (see **`.gitignore`**).
