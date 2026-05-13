# README — Exploration Exercise (Prototype 7, Chapter 7)

**Student:** Sarah Volynsky  
**Repository:** https://github.com/sarahvolynsky/hcde563-recommender-prototype-7

---

## 1. Exercise attempted

Completed **Chapter 7 — Preference elicitation (rating movies)** work in **Prototype 7**: Flask UI for collecting **explicit** movie ratings with optional **speech-to-text**, TMDB-linked movie guesses, and multi-turn LLM-generated follow-up questions. This submission implements textbook explorations:

| Exploration | Tier | Summary |
|-------------|------|---------|
| **7.1** | Easy | Replaced generic Prototype-style interview question generation during rating with **`rating_followup_question_request()`** — prompts target **one specific film**, use synopsis/candidates when known, avoid generic taste-only questions (see **`web/prompts.py`**, **`web/llm.py`**, **`web/serve_rating.py`**). |
| **7.2** | Medium | Rating page **prior Q&amp;A collapsed** under **“Earlier answers”** (`<details>`); main view emphasizes the **current** question plus dictation/movie controls, similar in spirit to the **mini-interview** flow (**`web/templates/rate_movies.html`**). |
| **7.3** | Hard | *(Not implemented here.)* |

Also maintained course integration: **`rebert/_prototype_7_`** under the same **`rebert`** tree as **`classes`**, **`recommender_7.0.py`** launcher (**`sys.executable -m flask`** fix for venv), **`run.sh`**, **`README`**, symlink instructions.

---

## 2. Modifications (files changed)

| Path | Change |
|------|--------|
| **`rebert/_prototype_7_/web/prompts.py`** | **`RATING_FOLLOWUP_SYSTEM_PROMPT`**, **`RATING_FOLLOWUP_USER_PROMPT`**; syllabus GenAI note in header comments. |
| **`rebert/_prototype_7_/web/llm.py`** | **`_rating_movie_context_for_prompt()`**, **`rating_followup_question_request()`**; GenAI disclosure comment. |
| **`rebert/_prototype_7_/web/serve_rating.py`** | Calls **`rating_followup_question_request(session_state, …)`** instead of **`qna_question_request(None, …)`** for follow-up rating questions; GenAI disclosure comment. |
| **`rebert/_prototype_7_/web/templates/rate_movies.html`** | Step indicator; prior Q&A in **`<details>`** (Explore 7.2). |
| **`rebert/_prototype_7_/recommender_7.0.py`** | Flask started via **`python -m flask`** so venv works without global **`flask` CLI** (prior fix). |
| **Root `run.sh`, `.gitignore`, `README*.md`** | Repo scaffolding, submission text. |

**Unchanged:** **`qna_question_request()`** remains for **Prototype 6–style ephemeral** flow (**`serve_ephem_rec.py`**).

---

## 3. Why this repository layout

Code imports **`rebert._prototype_7_.web.*`**, so **`rebert/_prototype_7_/`** must live **inside** the same **`rebert`** package as **`classes`** on your disk. This repo ships **`rebert/_prototype_7_/`** plus a minimal **`rebert/__init__.py`**.

---

## 4. Use of GenAI (**Cursor / Composer**)

Used for repository layout, symlink documentation, **`run.sh`**, Flask launcher fix, **Explore 7.1** (prompt + LLM routing), **Explore 7.2** (template tweak), syllabus **GenAI disclosure** blocks in **`serve_rating.py`**, **`prompts.py`**, **`llm.py`**, and README drafting. Course-author headers preserved where supplied.

---

## 5. Data

- TMDB/OpenAI (**KeyManager**) at runtime; no API keys committed.
- Optional test ratings: **`rebert/_prototype_7_/web/data/_rated_movies_test_.json`**.
- Scratch JSON under **`web/tmp/`** ignored by `.gitignore` (aside from **`.gitkeep`**).

---

## 6. How to wire into your course tree (required)

**`PYTHONPATH`** must be the folder that contains **`rebert`** **with** **`classes`** and **`_prototype_7_`** (typically **`~/Documents/HCDE 563`**).

Symlink example:

```bash
COURSE_REBERT="$HOME/Documents/HCDE 563/rebert"
CLONE_ROOT="$HOME/Documents/HCDE 563/rebert/hcde563-recommender-prototype-7"
rm -rf "$COURSE_REBERT/_prototype_7_"
ln -s "$CLONE_ROOT/rebert/_prototype_7_" "$COURSE_REBERT/_prototype_7_"
```

Verify:

```bash
source ~/.zshenv
python3 -c "import rebert._prototype_7_.web.config; import rebert.classes.data.KeyManager"
```

---

## 7. How to run

```bash
cd "$HOME/Documents/HCDE 563/rebert/_prototype_7_"   # or symlink target
python3 -m venv .venv
.venv/bin/pip install flask requests beautifulsoup4
source ~/.zshenv
chmod +x run.sh && ./run.sh
```

- **Smoke mockup:** `./run.sh -mockup -delay 2`
- **Port conflict (e.g. AirPlay on 5000):** `./run.sh -port 5001`
- Keys: **`api.openai.com`** and **`api.themoviedb.org`** in KeyManager — see **`rebert/_prototype_7_/README.md`** for detail.

---

## 8. Notes / caveats

- Widen **`REBERT_WINDOW_*`** in **`web/config.py`** if startup finds no recent openings after scraping.
- **Explore 7.3** (user settings persistence) would be a separate design pass.

---

## 9. Evidence of completion

- **7.1:** Server logs show follow-up questions after **`rating_followup_question_request`**; prompts reference matched movie synopsis when TMDB candidate exists.
- **7.2:** **Rate Movies** UI shows step line + **Earlier answers** disclosure; dictation/synopsis dropdown behavior unchanged.

---

## 10. Submission

Submit this repository’s URL on **Canvas** and grant access:

- dwmc@uw.edu  
- hjbyeon@uw.edu  
