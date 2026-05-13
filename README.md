# README — Exploration Exercise (Prototype 7)

**Student:** Sarah Volynsky  
**Repository:** https://github.com/sarahvolynsky/hcde563-recommender-prototype-7

---

## 1. Exercise attempted

This repository holds **Prototype 7**: a **Flask** web UI (`recommender_7.0.py` and **`rebert/_prototype_7_/web/`**) that uses **`rebert.classes`** (KeyManager, TomatoRelease, TMDB helpers) and injects release data into the app.

---

## 2. Why this layout

Code imports **`rebert._prototype_7_.web.*`**, so **`rebert/_prototype_7_/`** must appear **inside** the same **`rebert`** package tree as **`classes`** on your machine.

This Git repo only contains **`rebert/_prototype_7_/`** (plus a minimal **`rebert/__init__.py`** for packaging). Your course **`rebert/classes`** stays on disk where you already have it (see **§5**).

---

## 3. Modifications (repository files)

| Item | Purpose |
|------|--------|
| **`rebert/_prototype_7_/`** | Course Prototype 7 app (from official zip) |
| **`rebert/_prototype_7_/README.md`** | Detailed run notes (keys, mockup, **`config.py`** windows) |
| **`rebert/_prototype_7_/run.sh`** | Sources **`~/.zshenv`**; runs **`recommender_7.0.py`** with **`rebert/_prototype_7_/.venv`** if present |
| **`.gitignore`** | Omits **`.venv`**, **`web/tmp/*.json`** cache, secrets |

Standalone repo scaffolding (this README, top-level **`run.sh`**) added with **Cursor**.

---

## 4. Use of GenAI

**Cursor** helped with documenting setup, symlink instructions, **`run.sh`**, and migrating Prototype 7 out of the Prototype 1 repository.

Course-author code remains attributed in file headers where present.

---

## 5. How to wire this into your course tree (required to run)

**`PYTHONPATH`** must be the folder that contains the **`rebert`** directory whose **`classes`** package you already use (usually **`~/Documents/HCDE 563`**). That **same** **`rebert`** folder must expose **`rebert._prototype_7_`** — i.e. it needs **`_prototype_7_`** as a subdirectory.

After cloning **this repo**, symlink (or **`rsync`**) **`_prototype_7_`** into your course **`rebert`** folder:

```bash
COURSE_REBERT="$HOME/Documents/HCDE 563/rebert"
CLONE_ROOT="$HOME/Documents/HCDE 563/rebert/hcde563-recommender-prototype-7"

rm -rf "$COURSE_REBERT/_prototype_7_"
ln -s "$CLONE_ROOT/rebert/_prototype_7_" "$COURSE_REBERT/_prototype_7_"
```

Then use **`PYTHONPATH`** = **`"$HOME/Documents/HCDE 563"`** (or set in **`~/.zshenv`** as you already do for Prototypes 1–2).

Verify:

```bash
source ~/.zshenv
python3 -c "import rebert._prototype_7_.web.config; import rebert.classes.data.KeyManager"
```

---

## 6. How to run

After **§5 symlink** (or copying **`rebert/_prototype_7_`** into your course **`rebert`** tree), open a terminal:

```bash
cd "$HOME/Documents/HCDE 563/rebert/_prototype_7_"
python3 -m venv .venv
.venv/bin/pip install flask requests beautifulsoup4

source ~/.zshenv
chmod +x run.sh
./run.sh
```

Smoke test without the full TMDB/OpenAI warmup path:

```bash
./run.sh -mockup -delay 2
```

Full stack needs **KeyManager** keys for **`api.openai.com`** and **`api.themoviedb.org`** — see **`rebert/_prototype_7_/README.md`**.

From **this repository’s root** you can also:

```bash
source ~/.zshenv
chmod +x run.sh && ./run.sh
```

The top-level **`run.sh`** changes into **`rebert/_prototype_7_/`**; ensure **§5** is satisfied so **`import rebert.classes…`** still works.

---

## 7. Notes / caveats

- If startup says **no recent movie openings**, widen **`REBERT_WINDOW_*`** in **`rebert/_prototype_7_/web/config.py`**.
- First-time data collection can take several minutes.
- Do not commit API keys or **`.venv`**.

---

## 8. Evidence of completion

Mockup and full server run successfully when **`rebert.classes`** and **`rebert._prototype_7_`** resolve from the same course **`rebert`** tree.

---

## 9. Submission

Submit this repository’s link on **Canvas** and share access with:

- dwmc@uw.edu  
- hjbyeon@uw.edu  
